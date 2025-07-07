FROM docker.io/library/alpine:latest AS build
RUN wget -O speedtest.tgz \
	  "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz" \
	  && tar zxvf speedtest.tgz \
	  && chmod +x speedtest && chown root:root speedtest

FROM docker.io/library/alpine:latest
COPY --from=build /speedtest /bin/
COPY record_speedtest_docker.sh /bin/record_speedtest.sh
RUN apk add --no-cache zabbix-utils
RUN adduser -S speedtest
USER speedtest

ENTRYPOINT ["/bin/record_speedtest.sh"]
