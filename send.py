#!/usr/bin/python

import os
import sys
import time
import signal
import subprocess
import codecs

try:
	EXE = sys.argv[1], "rb"
	FILE  = open(sys.argv[2], "rb")
except:
	print('USAGE : send.py PATH_TO_SIGNAL_EXECUTABLE PATH_TO_FILE_TO_SEND')
	print('LINUX EXAMPLE : ./send.py ./signal test')
	print('WINDOWS EXAMPLE : python .\send.py .\signal.exe test.txt')
	exit(1)
TIME = 0.5
# this is the transmission's rate, can be modified here and in geter.py
START = 1

def send(bit):
	if int(bit) == 0:
		time.sleep(TIME)
		return 0
	amplitude = subprocess.Popen(EXE, stdout=subprocess.PIPE, shell=False)
	time.sleep(TIME)
	os.kill(amplitude.pid, signal.SIGTERM)

def encode(byte):
#	bits=bin(int(byte.encode('hex_codec'),16))[2:]
	bits=bin(int(codecs.encode(byte,'hex'),16))[2:]
	for i in range(8-len(bits)):
		bits='0'+bits
	print("SENDING : "+str(byte))
	for bit in bits:
		send(bit)
		print(bit)

try:
	byte = FILE.read(1)
#	while byte != "":
	while byte:
		send(START)
		encode(byte)
		byte = FILE.read(1)
finally:
	FILE.close()
