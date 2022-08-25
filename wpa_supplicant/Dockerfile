FROM alpine
RUN apk add --no-cache \
		wpa_supplicant

CMD ["wpa_supplicant", "-i", "eth0", "-c", "/etc/wpa_supplicant.conf"]
