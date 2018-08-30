build:
	docker build \
		-t gaiar/arm-distcc \
		--compress .

all:
	armv6 armv7 armv8

armv6:
	docker run -d \
		--name distcc-server-armv6 \
		--env-file armv6l.env \
		-v "/home/gaiar/x-tools/armv6-rpi-linux-gnueabi":"/tools":rw \
		-p 36326:3632 \
		gaiar/arm-distcc

armv7:
	docker run -d \
		--name distcc-server-armv7 \
		--env-file armv6l.env \
		-v "/home/gaiar/x-tools/armv7-rpi2-linux-gnueabihf":"/tools":rw \
		-p 36327:3632 \
		gaiar/arm-distcc

armv8:
	docker run -d \
		--name distcc-server-armv8 \
		--env-file armv6l.env \
		-v "/home/gaiar/x-tools/armv8-rpi3-linux-gnueabihf":"/tools":rw \
		-p 36328:3632 \
		gaiar/arm-distcc
