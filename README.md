# [WIP] distccd-rpi

## Distributed compilation between multiples hosts to speed up rpi compilation process

This docker container helps me to compile multiples projects on the raspberry pi faster (really faster) by distributing the compilation on differents host with a stronger cpu. The default behavior is to allow any ip from private subnets :10.0.0.0/8, 172.16.0.0/12,192.168.0.0/16. 

### Quick start : 

You have to clone the [raspberry pi toolchain](https://github.com/raspberrypi/tools) somewhere or use your own built by [crosstool-ng](https://github.com/crosstool-ng/crosstool-ng): 

Change paths in Makefile

`make build`
`make armv6`

example : ``

### On the raspberry pi : 

install distcc 

`pi@pi3:~ $ sudo apt-get install distcc`

edit your ~/.distcc/hosts and put the ip(s)/hostname(s) of the running docker containers machines

and finally :

`pi@pi3:~ $ make -j16 CXX=/usr/lib/distcc/arm-linux-gnueabihf-g++ CC=/usr/lib/distcc/arm-linux-gnueabihf-gcc`
