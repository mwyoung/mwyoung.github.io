---
layout: post
title: "Programming ATmega328P"
date: 2019-10-05
---
Note: code for this project is available
[here](https://github.com/mwyoung/avr-serial-test).

## Introduction
For learning microcontrollers, Arduino is a good introduction to the higher level concepts
and abilities of a microcontroller. However, directly programming with the microcontroller
in C can provide a greater learning opportunity (while also being less portable).

However, an example of needing to use the Arduino setup would be the [weather station]({%
link _pages/weather-station.md %}), as it used an ESP8266 and is not programmable using
this method.

This project was tested on an Arduino Nano with an ATmega328P and
[CH340](https://cdn.sparkfun.com/datasheets/Dev/Arduino/Other/CH340DS1.PDF) USB
communications chip.

### Programmer
<img align="right" height="400"
src="https://user-images.githubusercontent.com/10273995/65840436-fe0dc880-e2cd-11e9-9c16-e0c4f4990c73.jpg"/>
One of the easier (and cheaper) programmers to use would be the
[USBasp](https://www.fischl.de/usbasp/), as it is open source and as such has a lot of
clones with [adapters](https://images-na.ssl-images-amazon.com/images/I/413VwJ9UxQL.jpg)
to make flashing on Arduino platforms easier.

The USBasp can also update/flash the bootloader on the Arduino, as the bootloader makes
flashing the Arduino possible. In the Arduino IDE, in tools set the programmer to
**USBASP** and then select **Burn Bootloader**.

However, this setup unlike the Arduino setup uses the [D11 to D13
pins](https://www.arduino.cc/en/uploads/Main/Arduino_Nano-Rev3.2-SCH.pdf) (MOSI, MISO,
SCK) when programming. The USBasp can always be disconnected after programming if those
pins are needed (from the 10 pin to USBasp connection point, or disconnecting the 5V/3.3V
power).

For better debugging, serial communication can be used with the same interface as the
Arduino programmer (USB) or an [I²C HD44780
display](https://www.sunfounder.com/learn/sensor-kit-v2-0-for-arduino/lesson-1-display-by-i2c-lcd1602-sensor-kit-v2-0-for-arduino.html)
if there is audio work with fluctuations from the host USB
([code](http://davidegironi.blogspot.com/2013/06/an-avr-atmega-library-for-hd44780-based.html)). This display can also be tested using [Arduino](https://github.com/enjoyneering/LiquidCrystal_I2C).
An example of this setup is shown to the right.

### Programming

The easiest way to rapidly program on Linux would to use a makefile, as a `make program`
is all that is required in order to start programming the microcontroller. The required
programs include make (to setup the compiler), avr-gcc (compiler), and avrdude (programmer).

The included [makefile](https://github.com/mwyoung/avr-serial-test/blob/master/makefile)
for this project builds the code in a folder and then flashes the microcontroller. It can
also get the assembly code if needing to look at the preformance, along with outputs the
size when programming the microcontroller.

Available commands include `make program` (compile and program), `make compile` (compile
only) `make size`, `make asm` (for assembly code). Both the compile and program also will
warn of errors when compiling.

### Serial Monitor
For Linux based systems, the application
[moserial](https://wiki.gnome.org/action/show/Apps/Moserial) can be used. This allows
serial communication to be send and received, and is quite easy to use. The command `make
serialcomm` opens the serial monitor with the first /dev/ttyUSB\* port found on the
system.

For Windows, [Tera Term](https://ttssh2.osdn.jp/index.html.en),
[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/), or the Arduino IDE can be
used.

### Other Resources
[abcminiuser -
AVRfreaks](https://www.avrfreaks.net/forum/tut-soft-using-usart-serial-communications)
includes sample code that helped in the development of this code.

[Oregon State ECE 473](http://classes.engr.oregonstate.edu/eecs/fall2017/ece473-001/)
([archive.org
link](https://web.archive.org/web/20181026192456/http://classes.engr.oregonstate.edu/eecs/fall2017/ece473-001/))
is a pretty good resource on ATmega128 in specific along with I²C, SPI, UART, timers,
schematics, pushbutton debounce code, interrupts and fuses. This can be used in addition
to the manual for an AVR microcontroller. There is also a sample
[makefile](https://web.archive.org/web/20191030214411/http://web.engr.oregonstate.edu/~traylor/ece473/labs/11_labs/lab1/Makefile)
available.
