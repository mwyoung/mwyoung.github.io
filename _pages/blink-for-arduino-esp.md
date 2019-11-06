---
layout: post
title: "Blink for Arduino or ESP8266"
date: 2019-10-08
---

### Intro
This [code repository](https://github.com/mwyoung/Blink) was created in order to store
examples of the blink program for Arduino and ESP8266 devices to make sure the hardware is
working.

It contains a makefile for using arduino-mk to flash an Arduino Nano from a
command line prompt. There are other projects for using makefiles with ESP8266 devices.

### Blink

This code is the same as the default Arduino blink code, but updates with a better delay
along with different defines dependiing on if using an Arduino or ESP8266. The included
makefile contains code to launch stty, which is a command line based serial communication
software.

### Serial Communication
The
[serial_blink](https://github.com/mwyoung/Blink/blob/master/Serial_Blink/Serial_Blink.ino)
contains code to test receiving text from a serial console and blinks every second to show
that the code is currently running. The included makefile also contains code to launch the
GUI based serial communication software moserial.

<details>
<summary>serial_blink.ino</summary>
{% highlight c%}
{% include Serial_Blink.ino %}
{% endhighlight %}
</details>
<h6>&nbsp;</h6>
