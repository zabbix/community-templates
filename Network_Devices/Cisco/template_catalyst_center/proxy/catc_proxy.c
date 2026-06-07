#define _GNU_SOURCE
#include <microhttpd.h>
#include <curl/curl.h>
#include <jansson.h>
#include <pthread.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <time.h>
#include <unistd.h>

#define DEFAULT_PORT 8080
#define DEFAULT_HOST_HEADER "X-CatC-Host"
#define DEFAULT_ADMIN_TOKEN ""
#define DEFAULT_TOKEN_SKEW 30
#define DEFAULT_TIMEOUT 30L
#define MAX_BODY_SIZE (8 * 1024 * 1024)
#define RETRYABLE_AUTH_HTTP_1 401
#define RETRYABLE_AUTH_HTTP_2 403

typedef enum { LOG_ERROR = 0, LOG_INFO = 1, LOG_DEBUG = 2 } log_level_t;

typedef struct header_node {
    char *name;
    char *value;
    struct header_node *next;
} header_node_t;

typedef struct {
    char *data;
    size_t size;
} mem_buf_t;

typedef struct token_entry {
    char *host;
    char *username;
    char *password;
    char *token;
    time_t expires_at;
    time_t last_auth_at;
    struct token_entry *next;
} token_entry_t;

typedef struct {
    char *listen_addr;
    unsigned short listen_port;
    char *catc_host_header;
    int insecure_ssl;
    long timeout_sec;
    int token_skew_sec;
    char *admin_token;
    int auto_paginate;
    long paginate_page_size;
    int paginate_max_pages;
    long paginate_max_records;
    long paginate_max_seconds;
} config_t;

typedef struct {
    struct MHD_PostProcessor *post_processor;
    char *body;
    size_t body_size;
    int body_too_large;
} conn_ctx_t;

typedef struct {
    CURL *curl;
    char *buf;
    size_t len;
    int failed;
    int count;
} query_build_ctx_t;

static volatile sig_atomic_t g_stop = 0;
static log_level_t g_log_level = LOG_INFO;
static pthread_mutex_t g_cache_mu = PTHREAD_MUTEX_INITIALIZER;
static token_entry_t *g_cache = NULL;
static config_t g_cfg;

static void log_msg(log_level_t level, const char *fmt, ...) {
    if (level > g_log_level) return;
    const char *label = level == LOG_ERROR ? "ERROR" : level == LOG_DEBUG ? "DEBUG" : "INFO";
    time_t now = time(NULL);
    struct tm tm_now;
    gmtime_r(&now, &tm_now);
    char ts[32];
    strftime(ts, sizeof(ts), "%Y-%m-%dT%H:%M:%SZ", &tm_now);

    fprintf(stdout, "%s [%s] ", ts, label);
    va_list ap;
    va_start(ap, fmt);
    vfprintf(stdout, fmt, ap);
    va_end(ap);
    fputc('\n', stdout);
    fflush(stdout);
}

static void on_signal(int sig) {
    (void)sig;
    g_stop = 1;
}

static const char *env_default(const char *name, const char *def) {
    const char *v = getenv(name);
    return (v && *v) ? v : def;
}

static int parse_bool_env(const char *name, int def) {
    const char *v = getenv(name);
    if (!v || !*v) return def;
    return (!strcasecmp(v, "1") || !strcasecmp(v, "true") || !strcasecmp(v, "yes") || !strcasecmp(v, "on")) ? 1 : 0;
}

static log_level_t parse_log_level(const char *s) {
    if (!s) return LOG_INFO;
    if (!strcasecmp(s, "error")) return LOG_ERROR;
    if (!strcasecmp(s, "debug")) return LOG_DEBUG;
    return LOG_INFO;
}

static char *xstrdup(const char *s) {
    if (!s) return NULL;
    char *p = strdup(s);
    if (!p) {
        perror("strdup");
        exit(2);
    }
    return p;
}

static void free_headers(header_node_t *h) {
    while (h) {
        header_node_t *n = h->next;
        free(h->name);
        free(h->value);
        free(h);
        h = n;
    }
}

static void add_header_node(header_node_t **head, const char *name, const char *value) {
    header_node_t *n = calloc(1, sizeof(*n));
    if (!n) return;
    n->name = xstrdup(name);
    n->value = xstrdup(value ? value : "");
    n->next = *head;
    *head = n;
}

static const char *find_header(header_node_t *h, const char *name) {
    for (; h; h = h->next) {
        if (!strcasecmp(h->name, name)) return h->value;
    }
    return NULL;
}

static void log_headers_debug(const char *prefix, header_node_t *h) {
    if (g_log_level < LOG_DEBUG) return;
    for (; h; h = h->next) {
        log_msg(LOG_DEBUG, "%s header %s: %s", prefix, h->name, h->value);
    }
}

static void log_body_preview_debug(const char *prefix, const char *body) {
    if (g_log_level < LOG_DEBUG || !body) return;
    size_t len = strlen(body);
    size_t show = len > 512 ? 512 : len;
    log_msg(LOG_DEBUG, "%s body_len=%zu preview=%.*s%s",
            prefix, len, (int)show, body, len > show ? "..." : "");
}

static int send_response(struct MHD_Connection *connection, unsigned int status, const char *body, const char *ctype, header_node_t *extra_headers) {
    struct MHD_Response *resp = MHD_create_response_from_buffer(body ? strlen(body) : 0,
                                                                (void *)(body ? body : ""),
                                                                MHD_RESPMEM_MUST_COPY);
    if (!resp) return MHD_NO;
    if (ctype) MHD_add_response_header(resp, "Content-Type", ctype);
    for (header_node_t *h = extra_headers; h; h = h->next) {
        MHD_add_response_header(resp, h->name, h->value);
    }
    int ret = MHD_queue_response(connection, status, resp);
    MHD_destroy_response(resp);
    return ret;
}

static int body_append(conn_ctx_t *ctx, const char *data, size_t sz) {
    if (!sz) return MHD_YES;
    if (ctx->body_size + sz > MAX_BODY_SIZE) {
        ctx->body_too_large = 1;
        return MHD_NO;
    }
    char *newbuf = realloc(ctx->body, ctx->body_size + sz + 1);
    if (!newbuf) return MHD_NO;
    ctx->body = newbuf;
    memcpy(ctx->body + ctx->body_size, data, sz);
    ctx->body_size += sz;
    ctx->body[ctx->body_size] = '\0';
    return MHD_YES;
}

static enum MHD_Result iter_headers(void *cls, enum MHD_ValueKind kind, const char *key, const char *value) {
    (void)kind;
    header_node_t **head = cls;
    add_header_node(head, key, value ? value : "");
    return MHD_YES;
}

static enum MHD_Result iter_post(void *coninfo_cls, enum MHD_ValueKind kind, const char *key,
                                 const char *filename, const char *content_type,
                                 const char *transfer_encoding, const char *data, uint64_t off,
                                 size_t size) {
    (void)kind; (void)key; (void)filename; (void)content_type; (void)transfer_encoding; (void)off;
    conn_ctx_t *ctx = coninfo_cls;
    return body_append(ctx, data, size) ? MHD_YES : MHD_NO;
}

static int append_bytes(char **buf, size_t *len, const char *src, size_t add) {
    char *p = realloc(*buf, *len + add + 1);
    if (!p) return -1;
    *buf = p;
    memcpy(*buf + *len, src, add);
    *len += add;
    (*buf)[*len] = '\0';
    return 0;
}

static enum MHD_Result iter_get_args(void *cls, enum MHD_ValueKind kind, const char *key, const char *value) {
    (void)kind;
    query_build_ctx_t *q = cls;
    q->count++;

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "incoming query arg key=%s value=%s",
                key ? key : "(null)",
                value ? value : "(null)");
    }

    char *ek = curl_easy_escape(q->curl, key ? key : "", 0);
    char *ev = curl_easy_escape(q->curl, value ? value : "", 0);
    if (!ek || !ev) {
        if (ek) curl_free(ek);
        if (ev) curl_free(ev);
        q->failed = 1;
        return MHD_NO;
    }

    const char *sep = strchr(q->buf, '?') ? "&" : "?";
    if (append_bytes(&q->buf, &q->len, sep, strlen(sep)) != 0 ||
        append_bytes(&q->buf, &q->len, ek, strlen(ek)) != 0 ||
        append_bytes(&q->buf, &q->len, "=", 1) != 0 ||
        append_bytes(&q->buf, &q->len, ev, strlen(ev)) != 0) {
        curl_free(ek);
        curl_free(ev);
        q->failed = 1;
        return MHD_NO;
    }

    curl_free(ek);
    curl_free(ev);
    return MHD_YES;
}

static char *build_path_qs_from_connection(struct MHD_Connection *connection, const char *url) {
    CURL *curl = curl_easy_init();
    if (!curl) return NULL;

    query_build_ctx_t q = {
        .curl = curl,
        .buf = xstrdup(url ? url : "/"),
        .len = strlen(url ? url : "/"),
        .failed = 0,
        .count = 0
    };

    MHD_get_connection_values(connection, MHD_GET_ARGUMENT_KIND, iter_get_args, &q);

    if (q.failed) {
        curl_easy_cleanup(curl);
        free(q.buf);
        return NULL;
    }

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "rebuilt path+query arg_count=%d result=%s", q.count, q.buf);
    }

    curl_easy_cleanup(curl);
    return q.buf;
}

static int path_matches_device_health(const char *url) {
    if (!url) return 0;
    return !strcmp(url, "/dna/intent/api/v1/device-health");
}

static int should_auto_paginate_request(const char *method, const char *url) {
    if (!g_cfg.auto_paginate) return 0;
    if (!method || strcasecmp(method, "GET")) return 0;
    if (!path_matches_device_health(url)) return 0;
    return 1;
}

static int get_query_param_long(const char *url, const char *key, long *out) {
    if (!url || !key || !out) return 0;
    const char *q = strchr(url, '?');
    if (!q) return 0;
    q++;
    size_t key_len = strlen(key);

    while (*q) {
        const char *amp = strchr(q, '&');
        const char *end = amp ? amp : q + strlen(q);
        const char *eq = memchr(q, '=', (size_t)(end - q));
        if (eq && (size_t)(eq - q) == key_len && !strncmp(q, key, key_len)) {
            char tmp[64];
            size_t val_len = (size_t)(end - eq - 1);
            if (val_len == 0 || val_len >= sizeof(tmp)) return 0;
            memcpy(tmp, eq + 1, val_len);
            tmp[val_len] = '\0';
            char *ep = NULL;
            long v = strtol(tmp, &ep, 10);
            if (!ep || *ep != '\0') return 0;
            *out = v;
            return 1;
        }
        if (!amp) break;
        q = amp + 1;
    }
    return 0;
}

static char *replace_or_add_query_param(const char *url, const char *key, long value) {
    if (!url || !key) return NULL;

    const char *q = strchr(url, '?');
    char *base = NULL;
    const char *query = NULL;
    if (q) {
        base = strndup(url, (size_t)(q - url));
        query = q + 1;
    } else {
        base = xstrdup(url);
        query = NULL;
    }
    if (!base) return NULL;

    char *out = xstrdup(base);
    free(base);
    if (!out) return NULL;
    size_t out_len = strlen(out);
    int first = 1;

    if (query && *query) {
        const char *p = query;
        size_t key_len = strlen(key);
        while (*p) {
            const char *amp = strchr(p, '&');
            const char *end = amp ? amp : p + strlen(p);
            const char *eq = memchr(p, '=', (size_t)(end - p));
            int is_target = 0;

            if (eq && (size_t)(eq - p) == key_len && !strncmp(p, key, key_len)) {
                is_target = 1;
            }

            if (!is_target && end > p) {
                const char *sep = first ? "?" : "&";
                if (append_bytes(&out, &out_len, sep, strlen(sep)) != 0 ||
                    append_bytes(&out, &out_len, p, (size_t)(end - p)) != 0) {
                    free(out);
                    return NULL;
                }
                first = 0;
            }

            if (!amp) break;
            p = amp + 1;
        }
    }

    char valbuf[64];
    snprintf(valbuf, sizeof(valbuf), "%ld", value);
    {
        const char *sep = first ? "?" : "&";
        if (append_bytes(&out, &out_len, sep, strlen(sep)) != 0 ||
            append_bytes(&out, &out_len, key, strlen(key)) != 0 ||
            append_bytes(&out, &out_len, "=", 1) != 0 ||
            append_bytes(&out, &out_len, valbuf, strlen(valbuf)) != 0) {
            free(out);
            return NULL;
        }
    }

    return out;
}

static void set_pagination_error(mem_buf_t *resp_body, header_node_t **resp_headers, long *status, const char *message) {
    free(resp_body->data);
    resp_body->data = xstrdup(message ? message : "{\"error\":\"auto-pagination failed\"}\n");
    resp_body->size = strlen(resp_body->data);
    if (*resp_headers) {
        free_headers(*resp_headers);
        *resp_headers = NULL;
    }
    add_header_node(resp_headers, "Content-Type", "application/json");
    *status = 502;
}

static int maybe_auto_paginate_response(const char *method, const char *raw_url, const char *target_url,
                                        header_node_t *incoming_headers, const char *body, const char *token,
                                        const char *host, const char *username,
                                        long *status, mem_buf_t *resp_body, header_node_t **resp_headers) {
    if (!should_auto_paginate_request(method, raw_url)) {
        return 0;
    }

    if (*status != 200 || !resp_body->data || !*resp_body->data) {
        if (g_log_level >= LOG_DEBUG) {
            log_msg(LOG_DEBUG, "pagination skip host=%s user=%s reason=initial_status_or_body_invalid status=%ld",
                    host, username, *status);
        }
        return 0;
    }

    long caller_offset = 1;
    if (get_query_param_long(target_url, "offset", &caller_offset) && caller_offset > 1) {
        log_msg(LOG_INFO, "pagination skip host=%s user=%s reason=caller_offset_gt_1 offset=%ld",
                host, username, caller_offset);
        return 0;
    }
    if (caller_offset < 1) caller_offset = 1;

    long caller_limit = 0;
    (void)get_query_param_long(target_url, "limit", &caller_limit);

    json_error_t jerr;
    json_t *root = json_loads(resp_body->data, 0, &jerr);
    if (!root) {
        log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=initial_json_parse_failed", host, username);
        set_pagination_error(resp_body, resp_headers, status,
                             "{\"error\":\"auto-pagination failed: initial JSON parse failed\"}\n");
        return -1;
    }

    json_t *arr = json_object_get(root, "response");
    json_t *total = json_object_get(root, "totalCount");
    if (!json_is_array(arr) || !json_is_integer(total)) {
        if (g_log_level >= LOG_DEBUG) {
            log_msg(LOG_DEBUG, "pagination skip host=%s user=%s reason=response_shape_not_supported",
                    host, username);
        }
        json_decref(root);
        return 0;
    }

    size_t merged_count = json_array_size(arr);
    long total_count = (long)json_integer_value(total);
    if (total_count < 0) total_count = 0;

    if (merged_count >= (size_t)total_count) {
        if (g_log_level >= LOG_DEBUG) {
            log_msg(LOG_DEBUG, "pagination not_needed host=%s user=%s merged=%zu total=%ld",
                    host, username, merged_count, total_count);
        }
        json_decref(root);
        return 0;
    }

    long page_size = caller_limit > 0 ? caller_limit : g_cfg.paginate_page_size;
    if (page_size < 1) page_size = 1;
    if (page_size > 500) page_size = 500;

    if ((long)total_count > g_cfg.paginate_max_records) {
        log_msg(LOG_ERROR, "pagination guardrail host=%s user=%s reason=total_exceeds_max total=%ld max=%ld",
                host, username, total_count, g_cfg.paginate_max_records);
        json_decref(root);
        set_pagination_error(resp_body, resp_headers, status,
                             "{\"error\":\"auto-pagination failed: totalCount exceeds configured maximum\"}\n");
        return -1;
    }

    time_t started = time(NULL);
    int pages_fetched = 1;
    long next_offset = caller_offset + (long)merged_count;

    log_msg(LOG_INFO,
            "pagination start host=%s user=%s path=%s first_page_records=%zu total=%ld caller_limit=%ld page_size=%ld",
            host, username, raw_url, merged_count, total_count, caller_limit, page_size);

    while (merged_count < (size_t)total_count) {
        if (pages_fetched >= g_cfg.paginate_max_pages) {
            log_msg(LOG_ERROR, "pagination guardrail host=%s user=%s reason=max_pages pages=%d max=%d merged=%zu total=%ld",
                    host, username, pages_fetched, g_cfg.paginate_max_pages, merged_count, total_count);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: maximum page count exceeded\"}\n");
            return -1;
        }
        if ((time(NULL) - started) >= g_cfg.paginate_max_seconds) {
            log_msg(LOG_ERROR, "pagination guardrail host=%s user=%s reason=max_seconds elapsed=%ld max=%ld merged=%zu total=%ld",
                    host, username, (long)(time(NULL) - started), g_cfg.paginate_max_seconds, merged_count, total_count);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: time budget exceeded\"}\n");
            return -1;
        }

        char *page_url = replace_or_add_query_param(target_url, "limit", page_size);
        char *page_url2 = page_url ? replace_or_add_query_param(page_url, "offset", next_offset) : NULL;
        free(page_url);
        if (!page_url2) {
            log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=build_page_url_failed", host, username);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: could not build next page URL\"}\n");
            return -1;
        }

        mem_buf_t page_body = {0};
        header_node_t *page_headers = NULL;
        long page_status = 0;

        if (g_log_level >= LOG_DEBUG) {
            log_msg(LOG_DEBUG, "pagination request host=%s user=%s page=%d offset=%ld limit=%ld url=%s",
                    host, username, pages_fetched + 1, next_offset, page_size, page_url2);
        }

        if (do_curl_request("GET", page_url2, incoming_headers, body, token, &page_status, &page_body, &page_headers) != 0) {
            free(page_url2);
            free_headers(page_headers);
            free(page_body.data);
            log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=upstream_request_failed page=%d",
                    host, username, pages_fetched + 1);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: upstream page request failed\"}\n");
            return -1;
        }
        free(page_url2);

        if (page_status != 200) {
            free_headers(page_headers);
            free(page_body.data);
            log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=upstream_status page=%d status=%ld",
                    host, username, pages_fetched + 1, page_status);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: upstream page returned non-200\"}\n");
            return -1;
        }

        json_error_t page_jerr;
        json_t *page_root = json_loads(page_body.data ? page_body.data : "", 0, &page_jerr);
        free_headers(page_headers);
        free(page_body.data);

        if (!page_root) {
            log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=page_json_parse_failed page=%d",
                    host, username, pages_fetched + 1);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: page JSON parse failed\"}\n");
            return -1;
        }

        json_t *page_arr = json_object_get(page_root, "response");
        if (!json_is_array(page_arr)) {
            log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=page_response_not_array page=%d",
                    host, username, pages_fetched + 1);
            json_decref(page_root);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: page response array missing\"}\n");
            return -1;
        }

        size_t page_count = json_array_size(page_arr);
        if (page_count == 0) {
            log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=page_empty page=%d merged=%zu total=%ld",
                    host, username, pages_fetched + 1, merged_count, total_count);
            json_decref(page_root);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: received empty page before completion\"}\n");
            return -1;
        }

        for (size_t i = 0; i < page_count; i++) {
            json_t *item = json_array_get(page_arr, i);
            if (json_array_append(arr, item) != 0) {
                log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=array_append_failed page=%d",
                        host, username, pages_fetched + 1);
                json_decref(page_root);
                json_decref(root);
                set_pagination_error(resp_body, resp_headers, status,
                                     "{\"error\":\"auto-pagination failed: merge append failed\"}\n");
                return -1;
            }
        }

        json_decref(page_root);
        merged_count += page_count;
        pages_fetched++;
        next_offset += (long)page_count;

        if ((long)merged_count > g_cfg.paginate_max_records) {
            log_msg(LOG_ERROR, "pagination guardrail host=%s user=%s reason=merged_exceeds_max merged=%zu max=%ld",
                    host, username, merged_count, g_cfg.paginate_max_records);
            json_decref(root);
            set_pagination_error(resp_body, resp_headers, status,
                                 "{\"error\":\"auto-pagination failed: merged record count exceeded configured maximum\"}\n");
            return -1;
        }

        if (g_log_level >= LOG_DEBUG) {
            log_msg(LOG_DEBUG, "pagination merged host=%s user=%s page=%d page_records=%zu merged=%zu total=%ld next_offset=%ld",
                    host, username, pages_fetched, page_count, merged_count, total_count, next_offset);
        }
    }

    json_object_set_new(root, "totalCount", json_integer((json_int_t)merged_count));

    char *merged_json = json_dumps(root, JSON_COMPACT);
    json_decref(root);
    if (!merged_json) {
        log_msg(LOG_ERROR, "pagination failed host=%s user=%s reason=json_dump_failed", host, username);
        set_pagination_error(resp_body, resp_headers, status,
                             "{\"error\":\"auto-pagination failed: final JSON serialization failed\"}\n");
        return -1;
    }

    free(resp_body->data);
    resp_body->data = merged_json;
    resp_body->size = strlen(merged_json);
    *status = 200;

    log_msg(LOG_INFO, "pagination complete host=%s user=%s path=%s pages=%d merged_records=%zu total=%ld",
            host, username, raw_url, pages_fetched, merged_count, total_count);
    return 0;
}

static size_t curl_write_cb(void *contents, size_t size, size_t nmemb, void *userp) {
    size_t total = size * nmemb;
    mem_buf_t *buf = userp;
    char *p = realloc(buf->data, buf->size + total + 1);
    if (!p) return 0;
    buf->data = p;
    memcpy(buf->data + buf->size, contents, total);
    buf->size += total;
    buf->data[buf->size] = '\0';
    return total;
}

static size_t curl_header_cb(char *buffer, size_t size, size_t nitems, void *userdata) {
    size_t total = size * nitems;
    header_node_t **head = userdata;
    char *line = strndup(buffer, total);
    if (!line) return total;
    char *colon = strchr(line, ':');
    if (colon) {
        *colon = '\0';
        char *value = colon + 1;
        while (*value == ' ' || *value == '\t') value++;
        char *end = value + strlen(value);
        while (end > value && (end[-1] == '\r' || end[-1] == '\n')) *--end = '\0';
        add_header_node(head, line, value);
    }
    free(line);
    return total;
}

static token_entry_t *cache_find_locked(const char *host, const char *username) {
    for (token_entry_t *e = g_cache; e; e = e->next) {
        if (!strcmp(e->host, host) && !strcmp(e->username, username)) return e;
    }
    return NULL;
}

static void cache_upsert(const char *host, const char *username, const char *password, const char *token, time_t expires_at) {
    pthread_mutex_lock(&g_cache_mu);
    token_entry_t *e = cache_find_locked(host, username);
    if (!e) {
        e = calloc(1, sizeof(*e));
        e->host = xstrdup(host);
        e->username = xstrdup(username);
        e->next = g_cache;
        g_cache = e;
    }
    free(e->password);
    free(e->token);
    e->password = xstrdup(password);
    e->token = xstrdup(token);
    e->expires_at = expires_at;
    e->last_auth_at = time(NULL);
    pthread_mutex_unlock(&g_cache_mu);
}

static void cache_invalidate(const char *host, const char *username) {
    pthread_mutex_lock(&g_cache_mu);
    token_entry_t *e = cache_find_locked(host, username);
    if (e) {
        free(e->token);
        e->token = NULL;
        e->expires_at = 0;
    }
    pthread_mutex_unlock(&g_cache_mu);
}

static char *cache_get_token_copy(const char *host, const char *username, int *known_expired) {
    *known_expired = 0;
    pthread_mutex_lock(&g_cache_mu);
    token_entry_t *e = cache_find_locked(host, username);
    char *out = NULL;
    if (e && e->token) {
        time_t now = time(NULL);
        if (e->expires_at > 0 && now >= e->expires_at - g_cfg.token_skew_sec) {
            *known_expired = 1;
        } else {
            out = xstrdup(e->token);
        }
    }
    pthread_mutex_unlock(&g_cache_mu);
    return out;
}

static int parse_basic_auth(const char *auth_hdr, char **username, char **password) {
    *username = NULL;
    *password = NULL;
    if (!auth_hdr || strncasecmp(auth_hdr, "Basic ", 6) != 0) return -1;

    const char *b64 = auth_hdr + 6;
    size_t len = strlen(b64);
    unsigned char *decoded = calloc(1, len + 4);
    if (!decoded) return -1;

    int outlen = curl_easy_unescape(NULL, b64, 0, NULL) ? 0 : 0;
    (void)outlen;

    static const signed char T[256] = {
        [0 ... 255] = -1,
        ['A']=0,['B']=1,['C']=2,['D']=3,['E']=4,['F']=5,['G']=6,['H']=7,['I']=8,['J']=9,['K']=10,['L']=11,['M']=12,
        ['N']=13,['O']=14,['P']=15,['Q']=16,['R']=17,['S']=18,['T']=19,['U']=20,['V']=21,['W']=22,['X']=23,['Y']=24,['Z']=25,
        ['a']=26,['b']=27,['c']=28,['d']=29,['e']=30,['f']=31,['g']=32,['h']=33,['i']=34,['j']=35,['k']=36,['l']=37,['m']=38,
        ['n']=39,['o']=40,['p']=41,['q']=42,['r']=43,['s']=44,['t']=45,['u']=46,['v']=47,['w']=48,['x']=49,['y']=50,['z']=51,
        ['0']=52,['1']=53,['2']=54,['3']=55,['4']=56,['5']=57,['6']=58,['7']=59,['8']=60,['9']=61,['+']=62,['/']=63
    };
    size_t j = 0;
    int val = 0, valb = -8;
    for (size_t i = 0; i < len; i++) {
        unsigned char c = (unsigned char)b64[i];
        if (c == '=') break;
        if (T[c] == -1) continue;
        val = (val << 6) + T[c];
        valb += 6;
        if (valb >= 0) {
            decoded[j++] = (unsigned char)((val >> valb) & 0xFF);
            valb -= 8;
        }
    }
    decoded[j] = '\0';
    char *sep = strchr((char *)decoded, ':');
    if (!sep) {
        free(decoded);
        return -1;
    }
    *sep = '\0';
    *username = xstrdup((char *)decoded);
    *password = xstrdup(sep + 1);
    free(decoded);
    return 0;
}

static int is_hop_or_internal_header(const char *name) {
    return !strcasecmp(name, "Host") ||
           !strcasecmp(name, "Authorization") ||
           !strcasecmp(name, "Content-Length") ||
           !strcasecmp(name, "Connection") ||
           !strcasecmp(name, "Transfer-Encoding") ||
           !strcasecmp(name, "Expect") ||
           !strcasecmp(name, g_cfg.catc_host_header) ||
           !strcasecmp(name, "X-CatC-Debug") ||
           !strcasecmp(name, "X-CatC-Admin-Token") ||
           !strcasecmp(name, "X-CatC-Port") ||
           !strcasecmp(name, "X-Forwarded-Proto") ||
           !strcasecmp(name, "X-Original-URI");
}

static int do_curl_request(const char *method, const char *url, header_node_t *incoming_headers, const char *body,
                           const char *token, long *http_code, mem_buf_t *resp_body, header_node_t **resp_headers) {
    CURL *curl = curl_easy_init();
    if (!curl) return -1;

    struct curl_slist *hdrs = NULL;
    for (header_node_t *h = incoming_headers; h; h = h->next) {
        if (is_hop_or_internal_header(h->name)) continue;
        char *line = NULL;
        if (asprintf(&line, "%s: %s", h->name, h->value) >= 0) {
            hdrs = curl_slist_append(hdrs, line);
            if (g_log_level >= LOG_DEBUG) {
                log_msg(LOG_DEBUG, "forwarding header %s: %s", h->name, h->value);

            }
        }
        free(line);
    }
    if (token) {
        char *line = NULL;
        if (asprintf(&line, "X-Auth-Token: %s", token) >= 0) {
            hdrs = curl_slist_append(hdrs, line);
            if (g_log_level >= LOG_DEBUG) {
                log_msg(LOG_DEBUG, "forwarding header X-Auth-Token: <redacted>");
            }
        }
        free(line);
    }

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, g_cfg.timeout_sec);
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 0L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, curl_write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, resp_body);
    curl_easy_setopt(curl, CURLOPT_HEADERFUNCTION, curl_header_cb);
    curl_easy_setopt(curl, CURLOPT_HEADERDATA, resp_headers);
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, hdrs);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, g_cfg.insecure_ssl ? 0L : 1L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, g_cfg.insecure_ssl ? 0L : 2L);

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "upstream request method=%s url=%s", method, url);
        log_body_preview_debug("upstream request", body);
    }

    if (!strcasecmp(method, "POST")) {
        curl_easy_setopt(curl, CURLOPT_POST, 1L);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, body ? body : "");
        curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, body ? (long)strlen(body) : 0L);
    } else if (strcasecmp(method, "GET")) {
        curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, method);
        if (body) {
            curl_easy_setopt(curl, CURLOPT_POSTFIELDS, body);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, (long)strlen(body));
        }
    }

    CURLcode rc = curl_easy_perform(curl);
    if (rc != CURLE_OK) {
        log_msg(LOG_ERROR, "curl request failed: method=%s url=%s err=%s", method, url, curl_easy_strerror(rc));
        curl_slist_free_all(hdrs);
        curl_easy_cleanup(curl);
        return -1;
    }
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, http_code);

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "upstream response status=%ld method=%s url=%s body_len=%zu",
                *http_code, method, url, resp_body->size);
        log_headers_debug("upstream response", *resp_headers);
        log_body_preview_debug("upstream response", resp_body->data);
    }

    curl_slist_free_all(hdrs);
    curl_easy_cleanup(curl);
    return 0;
}

static char *build_target_url(const char *scheme, const char *host, unsigned short port, const char *path_qs) {
    char *url = NULL;
    if (asprintf(&url, "%s://%s:%hu%s", scheme, host, port, path_qs) < 0) return NULL;
    return url;
}

static char *authenticate_catc(const char *scheme, const char *host, unsigned short port, const char *username, const char *password, long *status_out, char **raw_body_out) {
    *status_out = 0;
    *raw_body_out = NULL;
    char *url = NULL;
    if (asprintf(&url, "%s://%s:%hu/dna/system/api/v1/auth/token", scheme, host, port) < 0) return NULL;

    CURL *curl = curl_easy_init();
    if (!curl) { free(url); return NULL; }
    mem_buf_t body = {0};
    struct curl_slist *hdrs = NULL;
    hdrs = curl_slist_append(hdrs, "Content-Type: application/json");

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, g_cfg.timeout_sec);
    curl_easy_setopt(curl, CURLOPT_POST, 1L);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "");
    curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, 0L);
    curl_easy_setopt(curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
    curl_easy_setopt(curl, CURLOPT_USERNAME, username);
    curl_easy_setopt(curl, CURLOPT_PASSWORD, password);
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, hdrs);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, g_cfg.insecure_ssl ? 0L : 1L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, g_cfg.insecure_ssl ? 0L : 2L);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, curl_write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &body);

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "auth request url=%s user=%s", url, username);
    }

    CURLcode rc = curl_easy_perform(curl);
    if (rc != CURLE_OK) {
        log_msg(LOG_ERROR, "auth curl failed host=%s err=%s", host, curl_easy_strerror(rc));
        curl_slist_free_all(hdrs);
        curl_easy_cleanup(curl);
        free(url);
        free(body.data);
        return NULL;
    }
    curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, status_out);

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "auth response host=%s status=%ld body_len=%zu", host, *status_out, body.size);
        log_body_preview_debug("auth response", body.data);
    }

    curl_slist_free_all(hdrs);
    curl_easy_cleanup(curl);
    free(url);

    *raw_body_out = body.data ? xstrdup(body.data) : xstrdup("");
    if (*status_out != 200) {
        free(body.data);
        return NULL;
    }

    json_error_t jerr;
    json_t *root = json_loads(body.data ? body.data : "{}", 0, &jerr);
    free(body.data);
    if (!root) {
        log_msg(LOG_ERROR, "auth response JSON parse failed host=%s", host);
        return NULL;
    }
    json_t *tok = json_object_get(root, "Token");
    const char *token = json_is_string(tok) ? json_string_value(tok) : NULL;
    char *out = token ? xstrdup(token) : NULL;
    json_decref(root);
    return out;
}

static int copy_back_response(struct MHD_Connection *connection, long status, mem_buf_t *body, header_node_t *src_headers) {
    header_node_t *out = NULL;
    for (header_node_t *h = src_headers; h; h = h->next) {
        if (!strcasecmp(h->name, "Transfer-Encoding") || !strcasecmp(h->name, "Connection") || !strcasecmp(h->name, "Content-Length")) continue;
        add_header_node(&out, h->name, h->value);
    }
    int ret = send_response(connection, (unsigned int)status, body->data ? body->data : "", find_header(out, "Content-Type"), out);
    free_headers(out);
    return ret;
}

static int handle_admin(struct MHD_Connection *connection, const char *method) {
    if (strcasecmp(method, "POST") && strcasecmp(method, "GET")) {
        return send_response(connection, 405, "method not allowed\n", "text/plain", NULL);
    }
    const char *given = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "X-CatC-Admin-Token");
    if (g_cfg.admin_token[0] && (!given || strcmp(given, g_cfg.admin_token))) {
        return send_response(connection, 403, "forbidden\n", "text/plain", NULL);
    }
    const char *level = MHD_lookup_connection_value(connection, MHD_GET_ARGUMENT_KIND, "level");
    if (level && *level) g_log_level = parse_log_level(level);
    char buf[64];
    snprintf(buf, sizeof(buf), "log_level=%s\n", g_log_level == LOG_DEBUG ? "debug" : g_log_level == LOG_ERROR ? "error" : "info");
    return send_response(connection, 200, buf, "text/plain", NULL);
}

static enum MHD_Result handler(void *cls, struct MHD_Connection *connection,
                               const char *url, const char *method, const char *version,
                               const char *upload_data, size_t *upload_data_size, void **con_cls) {
    (void)cls; (void)version;
    conn_ctx_t *ctx = *con_cls;
    if (!ctx) {
        ctx = calloc(1, sizeof(*ctx));
        if (!ctx) return MHD_NO;
        *con_cls = ctx;
        return MHD_YES;
    }

    if (*upload_data_size) {
        if (body_append(ctx, upload_data, *upload_data_size) != MHD_YES) {
            *upload_data_size = 0;
            return MHD_NO;
        }
        *upload_data_size = 0;
        return MHD_YES;
    }


    if (!strcmp(url, "/__admin/loglevel")) {
        int ret = handle_admin(connection, method);
        return ret == MHD_YES ? MHD_YES : MHD_NO;
    }

    if (ctx->body_too_large) return send_response(connection, 413, "request body too large\n", "text/plain", NULL);

    const char *host = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, g_cfg.catc_host_header);
    const char *auth = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "Authorization");
    const char *scheme = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "X-Forwarded-Proto");
    if (!scheme || (*scheme != 'h' && *scheme != 'H')) scheme = env_default("DEFAULT_TARGET_SCHEME", "https");
    unsigned short target_port = (unsigned short)atoi(env_default("DEFAULT_TARGET_PORT", !strcasecmp(scheme, "http") ? "80" : "443"));
    const char *port_hdr = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "X-CatC-Port");
    if (port_hdr && *port_hdr) target_port = (unsigned short)atoi(port_hdr);

    if (!host || !*host) {
        return send_response(connection, 400, "missing Catalyst Center host header\n", "text/plain", NULL);
    }

    char *username = NULL, *password = NULL;
    if (parse_basic_auth(auth, &username, &password) != 0) {
        return send_response(connection, 400, "missing or invalid Basic Authorization header\n", "text/plain", NULL);
    }

    header_node_t *in_headers = NULL;
    MHD_get_connection_values(connection, MHD_HEADER_KIND, iter_headers, &in_headers);

    const char *full_uri = MHD_lookup_connection_value(connection, MHD_HEADER_KIND, "X-Original-URI");
    char *path_qs = full_uri ? xstrdup(full_uri) : build_path_qs_from_connection(connection, url);

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "incoming request method=%s raw_path=%s full_uri_hdr=%s host=%s target_port=%hu scheme=%s body_len=%zu",
                method,
                url ? url : "(null)",
                full_uri ? full_uri : "(null)",
                host,
                target_port,
                scheme ? scheme : "(null)",
                ctx->body ? strlen(ctx->body) : 0UL);
        log_headers_debug("incoming", in_headers);
        log_body_preview_debug("incoming", ctx->body);
    }

    if (!path_qs) {
        free(username); free(password); free_headers(in_headers);
        return send_response(connection, 500, "failed to build request path/query\n", "text/plain", NULL);
    }

    char *target_url = build_target_url(scheme, host, target_port, path_qs);

    if (g_log_level >= LOG_DEBUG) {
        log_msg(LOG_DEBUG, "forward path_qs=%s", path_qs);
        log_msg(LOG_DEBUG, "forward target_url=%s", target_url ? target_url : "(null)");
    }

    free(path_qs);

    if (!target_url) {
        free(username); free(password); free_headers(in_headers);
        return send_response(connection, 500, "failed to build target url\n", "text/plain", NULL);
    }

    int known_expired = 0;
    char *token = cache_get_token_copy(host, username, &known_expired);
    if (!token || known_expired) {
        long auth_status = 0;
        char *auth_raw = NULL;
        log_msg(LOG_INFO, "auth start host=%s user=%s", host, username);
        char *newtok = authenticate_catc(scheme, host, target_port, username, password, &auth_status, &auth_raw);
        if (!newtok) {
            log_msg(LOG_ERROR, "auth failed host=%s user=%s status=%ld", host, username, auth_status);
            int ret = send_response(connection, (unsigned int)(auth_status ? auth_status : 502), auth_raw ? auth_raw : "authentication failed\n", "application/json", NULL);
            free(auth_raw); free(target_url); free(username); free(password); free_headers(in_headers); free(token);
            return ret;
        }
        time_t expires_at = time(NULL) + 3600;
        cache_upsert(host, username, password, newtok, expires_at);
        token = newtok;
        log_msg(LOG_INFO, "auth ok host=%s user=%s token_cached_until=%ld", host, username, (long)expires_at);
        free(auth_raw);
    } else {
        log_msg(LOG_DEBUG, "cache hit host=%s user=%s", host, username);
    }

    mem_buf_t resp_body = {0};
    header_node_t *resp_headers = NULL;
    long status = 0;
    if (do_curl_request(method, target_url, in_headers, ctx->body, token, &status, &resp_body, &resp_headers) != 0) {
        free(target_url); free(username); free(password); free_headers(in_headers); free(token); free_headers(resp_headers); free(resp_body.data);
        return send_response(connection, 502, "upstream request failed\n", "text/plain", NULL);
    }

    if (status == RETRYABLE_AUTH_HTTP_1 || status == RETRYABLE_AUTH_HTTP_2) {
        log_msg(LOG_INFO, "upstream auth failure -> reauth host=%s user=%s status=%ld", host, username, status);
        cache_invalidate(host, username);
        free(token); token = NULL;
        free_headers(resp_headers); resp_headers = NULL;
        free(resp_body.data); resp_body.data = NULL; resp_body.size = 0;

        long auth_status = 0;
        char *auth_raw = NULL;
        char *newtok = authenticate_catc(scheme, host, target_port, username, password, &auth_status, &auth_raw);
        if (!newtok) {
            log_msg(LOG_ERROR, "reauth failed host=%s user=%s status=%ld", host, username, auth_status);
            int ret = send_response(connection, (unsigned int)(auth_status ? auth_status : status), auth_raw ? auth_raw : "reauthentication failed\n", "application/json", NULL);
            free(auth_raw); free(target_url); free(username); free(password); free_headers(in_headers);
            return ret;
        }
        cache_upsert(host, username, password, newtok, time(NULL) + 3600);
        token = newtok;
        free(auth_raw);
        if (do_curl_request(method, target_url, in_headers, ctx->body, token, &status, &resp_body, &resp_headers) != 0) {
            free(target_url); free(username); free(password); free_headers(in_headers); free(token); free_headers(resp_headers); free(resp_body.data);
            return send_response(connection, 502, "retry upstream request failed\n", "text/plain", NULL);
        }
    }

    if (maybe_auto_paginate_response(method, url, target_url, in_headers, ctx->body, token,
                                     host, username, &status, &resp_body, &resp_headers) != 0) {
        log_msg(LOG_ERROR, "proxy method=%s host=%s path=%s status=%ld reason=auto_pagination_failed",
                method, host, url, status);
    }

    log_msg(LOG_INFO, "proxy method=%s host=%s path=%s status=%ld", method, host, url, status);
    int ret = copy_back_response(connection, status, &resp_body, resp_headers);

    free(target_url);
    free(username);
    free(password);
    free_headers(in_headers);
    free_headers(resp_headers);
    free(resp_body.data);
    free(token);
    return ret == MHD_YES ? MHD_YES : MHD_NO;
}

static void completed(void *cls, struct MHD_Connection *connection, void **con_cls, enum MHD_RequestTerminationCode toe) {
    (void)cls; (void)connection; (void)toe;
    conn_ctx_t *ctx = *con_cls;
    if (!ctx) return;
    free(ctx->body);
    free(ctx);
    *con_cls = NULL;
}

static void load_config(void) {
    g_cfg.listen_addr = xstrdup(env_default("LISTEN_ADDR", "0.0.0.0"));
    g_cfg.listen_port = (unsigned short)atoi(env_default("LISTEN_PORT", "8080"));
    g_cfg.catc_host_header = xstrdup(env_default("CATC_HOST_HEADER", DEFAULT_HOST_HEADER));
    g_cfg.insecure_ssl = parse_bool_env("INSECURE_SSL", 1);
    g_cfg.timeout_sec = atol(env_default("UPSTREAM_TIMEOUT_SEC", "30"));
    g_cfg.token_skew_sec = atoi(env_default("TOKEN_SKEW_SEC", "30"));
    g_cfg.admin_token = xstrdup(env_default("ADMIN_TOKEN", DEFAULT_ADMIN_TOKEN));
    g_cfg.auto_paginate = parse_bool_env("AUTO_PAGINATE", 0);
    g_cfg.paginate_page_size = atol(env_default("PAGINATE_PAGE_SIZE", "500"));
    g_cfg.paginate_max_pages = atoi(env_default("PAGINATE_MAX_PAGES", "20"));
    g_cfg.paginate_max_records = atol(env_default("PAGINATE_MAX_RECORDS", "5000"));
    g_cfg.paginate_max_seconds = atol(env_default("PAGINATE_MAX_SECONDS", "25"));
    if (g_cfg.paginate_page_size < 1) g_cfg.paginate_page_size = 500;
    if (g_cfg.paginate_page_size > 500) g_cfg.paginate_page_size = 500;
    if (g_cfg.paginate_max_pages < 1) g_cfg.paginate_max_pages = 20;
    if (g_cfg.paginate_max_records < 1) g_cfg.paginate_max_records = 5000;
    if (g_cfg.paginate_max_seconds < 1) g_cfg.paginate_max_seconds = 25;
    g_log_level = parse_log_level(env_default("LOG_LEVEL", "info"));
}

int main(void) {
    signal(SIGINT, on_signal);
    signal(SIGTERM, on_signal);
    curl_global_init(CURL_GLOBAL_DEFAULT);
    load_config();

    log_msg(LOG_INFO,
            "starting catc-proxy listen=%s:%hu host_header=%s insecure_ssl=%d auto_paginate=%d paginate_page_size=%ld paginate_max_pages=%d paginate_max_records=%ld paginate_max_seconds=%ld",
            g_cfg.listen_addr, g_cfg.listen_port, g_cfg.catc_host_header, g_cfg.insecure_ssl,
            g_cfg.auto_paginate, g_cfg.paginate_page_size, g_cfg.paginate_max_pages,
            g_cfg.paginate_max_records, g_cfg.paginate_max_seconds);

    struct MHD_Daemon *daemon = MHD_start_daemon(
        MHD_USE_SELECT_INTERNALLY,
        g_cfg.listen_port,
        NULL, NULL,
        &handler, NULL,
        MHD_OPTION_NOTIFY_COMPLETED, completed, NULL,
        MHD_OPTION_SOCK_ADDR, NULL,
        MHD_OPTION_END);

    if (!daemon) {
        fprintf(stderr, "failed to start HTTP server\n");
        return 1;
    }

    while (!g_stop) sleep(1);

    log_msg(LOG_INFO, "stopping catc-proxy");
    MHD_stop_daemon(daemon);
    curl_global_cleanup();
    return 0;
}
