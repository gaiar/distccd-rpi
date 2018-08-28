build:
	docker build \
		-t gaiar/arm-distcc \
		--compress \
		--force-rm=true .

run:
	docker-compose up -d

armv6:
	docker run -d \
		--name distcc-server-armv6 \
		--env-file armv6l.env \
		-v "/home/gaiar/x-tools/armv6-rpi-linux-gnueabi":"/tools":rw \
		-p 36326:3632 \
		--user distccd \
		gaiar/arm-distcc

armv7:
	docker run -d \
		--name distcc-server-armv7 \
		--env-file armv6l.env \
		-v "/home/gaiar/x-tools/armv7-rpi2-linux-gnueabihf":"/tools":rw \
		--env-file armv7l.env \
		-p 36327:3632 \
		--user distccd \
		gaiar/arm-distcc

armv8:
	docker run -d \
		--name distcc-server-armv8 \
		--env-file armv6l.env \
		-v "/home/gaiar/x-tools/armv8-rpi3-linux-gnueabihf":"/tools":rw \
		--env-file armv8l.env \
		-p 36328:3632 \
		--user \
		distccd \
		gaiar/arm-distcc
