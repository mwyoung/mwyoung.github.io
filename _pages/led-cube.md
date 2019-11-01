---
layout: post
title: "LED Cube"
date: 2019-10-16
---

Code for this project is available [here](https://github.com/mwyoung/LED-Cube).

### Project Goals
The major goals for this project would be to create a LED cube using only AVR C and to use
shift registers for each output.

### LED Cube in Action
<p align="center">
<img src="https://user-images.githubusercontent.com/10273995/66527012-6703f600-eaaf-11e9-91d3-ce5843f21daa.gif"/>
</p>

### Hardware
The hardware used in this project includes an usbasp for programming, an Arduino Nano
(clone), 2 74HC595 shift registers, 0.1μF capacitors for the shift registers, 22 resistors,
64 LEDs, and 4 2N4401 BJTs.

For the physical hardware, blue and green LEDs were used due to a shortage of green LEDs.
This also created the pattern shown in the gif below where each corner and the middle LEDs
are blue, with the rest being green.

It is highly suggested to test each LED before soldering, and to also use a jig (see right).
This helps with placement of the image and also allows the structure to be layered on top
of another.

The jig was made by measuring the cathode (-) part of each LED, and finding
that distance. Each cathode leg was then bent, and formed into a grid like pattern with 4
rows and two crossbeams on either end. The anodes are then connected together for a total
of 16 inputs.

Finally, each LED was **tested**  with 5V and Ground (from any power source including an
Arduino) to make sure it connected properly in the structure and also not to have to
resolder when assembling the total structure.

Top layer example: (middle layers use blue (b) in center instead of green (g)).
<pre>
 Top layer:     Layer grid:     Side view:
 b--g--g--b     0  4  8  12     3 b--g--g--b
 |  |  |  |                       |  |  |  |
 g  g  g  g     1  5  9  13     2 g--g--g--g
 |  |  |  |                       |  |  |  |
 g  g  g  g     2  6  10 14     1 g--g--g--g
 |  |  |  |                       |  |  |  |
 b--g--g--b     3  7  11 15     0 b--g--g--b
</pre>

<details>
<summary><a
href="https://raw.githubusercontent.com/mwyoung/LED-Cube/master/Schematic/LED_Cube.svg?sanitize=true">Schematic</a></summary>
<img src="https://raw.githubusercontent.com/mwyoung/LED-Cube/master/Schematic/LED_Cube.svg?sanitize=true">
</details>
<h6>&nbsp;</h6>

### Software

The software used for this is just avr-gcc, make, and avrdude. Information about using
these tools can be found in [programming-atmega328]({% link
_pages/programming-atmega328.md %}).

The test programs below were used to test the hardware shift registers and LED layers.

### Test programs

There are three testing programs to test out certain functions on the hardware
individually.

The [74HC595_Test](https://github.com/mwyoung/LED-Cube/tree/master/tests/74HC595_Test)
folder contains a program to test the 74HC595 chip to output to 8 parallel LEDs. There is
an included schematic for the wiring below.

<details>
<summary>Schematic</summary>
<img src="https://raw.githubusercontent.com/mwyoung/LED-Cube/master/tests/74HC595_Test/Schematic/74HC595_Wiring.svg?sanitize=true">
</details>
<h6>&nbsp;</h6>

The [LED_Test](https://github.com/mwyoung/LED-Cube/tree/master/tests/LED_Test) is for
testing the LEDs in the completed cube layer by layer. It manually changes each transistor
to have only 1 on at a time.

The [Timer_Test](https://github.com/mwyoung/LED-Cube/tree/master/tests/Timer_Test) is for
testing the timers which control the BJTs. This code also has a section to change the
timing frequency from the default 240 FPS.

### Other Resources

The 4x4x4 cube by [chr](https://www.instructables.com/id/LED-Cube-4x4x4/).<br>
74HC595 shift register tutorial by
[Protostack](https://protostack.com.au/2010/05/introduction-to-74hc595-shift-register-controlling-16-leds/).<br>
74HC595 capacitor and resistor setup by [Nerd
Ralph](nerdralph.blogspot.com/2015/10/using-74hc595-as-74hc164-shift-register.html).<br>
