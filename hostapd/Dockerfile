FROM alpine
RUN apk add --no-cache \
		hostapd \
		ifupdown-ng \
		iputils \
		iproute2

COPY usr/libexec/ifupdown-ng /usr/libexec/ifupdown-ng/

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["hostapd", "/etc/hostapd/hostapd.conf"]
