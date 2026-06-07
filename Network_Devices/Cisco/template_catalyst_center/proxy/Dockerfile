FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential pkg-config libmicrohttpd-dev libcurl4-openssl-dev libjansson-dev ca-certificates && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /src
COPY catc_proxy.c .
RUN mkdir -p /out && \
    cc -O2 -Wall -Wextra -o /out/catc-proxy catc_proxy.c \
    $(pkg-config --cflags --libs libmicrohttpd libcurl jansson) -lpthread

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    libmicrohttpd12 libcurl4 libjansson4 ca-certificates && \
    rm -rf /var/lib/apt/lists/*
COPY --from=build /out/catc-proxy /usr/local/bin/catc-proxy
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/catc-proxy"]
