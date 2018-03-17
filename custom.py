# just some settings

import ConfigParser
import os
import pyaudio


PROG = 'soundmeter'
FRAMES_PER_BUFFER = 2048
#FRAMES_PER_BUFFER = 512
FORMAT = pyaudio.paInt16
CHANNELS = 2
#CHANNELS = 1
RATE = 44100
#RATE = 48000
AUDIO_SEGMENT_LENGTH = 0.5
# you can modify the frequency here and in send.py in order to fo more fast
RMS_AS_TRIGGER_ARG = False

