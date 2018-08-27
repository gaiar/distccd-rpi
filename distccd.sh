#!/bin/sh

if [ -z "$NETWORK" ]; then
	NETWORK=10.0.0.1/16
fi

if [ -z "$JOBS" ]; then
	JOBS=2
fi

exec distccd \
	--allow=$NETWORK \
	--jobs $JOBS \
	--daemon \
	--stats \
	--verbose \
	--log-stderr \
	--no-detach >>/var/log/distccd.log 2>&1
