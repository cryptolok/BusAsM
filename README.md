# BusAsM

AM radio data exfiltration without a system bus, but with a CPU cache in assembly.

To put it in a nutshell, my solution :
* More simple (few lines in assembly and some Python/JS scripts)
* More robust (written in assembly and JS)
* More reliable (less collisions)
* Cross-platform (Linux/Windows/BSD)
* Hardware-independent (32/64-bit/ARM)
* Software-independent (no dependencies whatsoever, except Python/JS for the PoC)

## Fork ?

You might already know about [System Bus Radio](https://github.com/fulldecent/system-bus-radio), which is a similar project, but what you might not know, is that I was working on the same research independently in my school.

The situation is pretty close to the opposite what has [happened](https://www.youtube.com/watch?v=YdlMHYHMM8Y) a century ago.
Basically :

Me : *"Ok, how could I use a computer hardware to create a robust radio signal in the AM band ?"*

William : *"Hey look, I found a way to encode the sound!"*

Me : *"OK, but modern computers can encode signals directly, thus you can boost it without an interpretation. You were the first though, but my solution is still more robust and simple."*

And yes, it's a second publication of my code (dates from mid-2016) since I removed it for some reasons.

Recently I discovered another similar research for [ARM](http://thesai.org/Downloads/Volume9No1/Paper_25-Data_Exfiltration_from_Air_Gapped_Computers.pdf), but it's totally different from mine, which is 2 years older anyway.

### So, what now ?

Nothing, I just wanted everybody to know, that it could be done otherwise and more efficiently.

See my [video](https://youtu.be/qNV-KRlZU6U) in comparison.

In fact, I'm doing almost the same thing in the opposite way, by sending 0es and 1s with direct instructions to the processor (using L1 cache) in assembly, which boost the signal significantly.

Besides, I made a Windows 32/64-bits and Android implementations as well, including JavaScript code.

So, I will provide a SOS signal PoC and a complete transmission solution.

A similar independent theoretical work [exists](https://dl.acm.org/citation.cfm?id=2742179) as well.

#### File transfer

I used a pretty old [radio](http://www.radiomuseum.org/r/panasonic_stereo_radio_cassette_player_rq_v60.html) and it's working great. Of course, you can use some SDR, but good luck for founding one that supports 1100kHz AM, in fact I'm using the radio as a microphone with Jack/Jack cable.

To amplify the signal, you can use an [antenna](https://www.amazon.com/SaferCCTV-Replacement-Tunable-Passive-Panasonic/dp/B01MT10PME/).

The encoding/modulation is pretty simple, 1 to begin and send next 8 bits (aka RS-232 8N0 MSB).

On the victims PC, you will need the signal's executable and the Python's script send.py, you can use [Portable Python](http://portablepython.com/) 2 or 3.
On your machine, you should have a Linux with [soundmeter](https://pypi.python.org/pypi/soundmeter) builded from sources. Then you just copy custom.py and geter.py to the build/lib.linux/soundmeter directory and it's ready. However, you will need to calibrate the LIMIT variable in geter.py

