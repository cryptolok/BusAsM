#!/bin/bash

dot(){
	./signal &
	sleep 0.1
	killall signal
	sleep 0.1
}

line(){
	./signal &
	sleep 0.3
	killall signal
	sleep 0.1
}

SOS(){
	dot
	dot
	dot
	line
	line
	line
	dot
	dot
	dot
}

while true
do
	sleep 1
	SOS
done
