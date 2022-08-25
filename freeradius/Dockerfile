FROM freeradius/freeradius-server:latest-alpine

RUN apk add --no-cache make openssl &&\
	cd /etc/raddb/certs/ &&\
	make clean &&\
	make destroycerts &&\
	make all &&\
	apk del make openssl
