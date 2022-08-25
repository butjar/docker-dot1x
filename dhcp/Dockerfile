FROM alpine
RUN apk add --no-cache \
		dhcp &&\
	touch /var/lib/dhcp/dhcpd.leases

CMD ["dhcpd", "-f"]
