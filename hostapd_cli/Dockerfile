FROM alpine
RUN apk add --no-cache \
		iproute2 \
		hostapd \
		nftables
COPY usr/local/bin/ /usr/local/bin/
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["hostapd_cli", "-i", "br0", "-a", "/usr/local/bin/802-1x"]
