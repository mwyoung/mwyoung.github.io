---
layout: post
title: "Weather Station"
date: 2019-10-15
---
Note: code for this project is available
[here](https://github.com/mwyoung/Weather-Station).

### Project Goals
The goals for this project include a weather station that is easy to view along with
containing lots of information about the current weather.

### Hardware
<img align="right" width="200"
src="https://user-images.githubusercontent.com/10273995/68053467-388dcb00-fca9-11e9-84e9-5c2e924aef77.jpg">
The hardware for this project includes an [ESP8266 WeMos D1
Mini](https://wiki.wemos.cc/products:d1:d1_mini), a 1.8 TFT LCD display, a PIR motion
sensor, buttons, resistors, BJTs (2n4401 and 2n4403), and a photoresistor.

The PIR motion sensor allows the weather station to automatically wake when motion is
detected along with having sleep hours in the night to not blind a user. The button is
used to manually update the device without having to reboot the weather station.

The photoresistor is used to adjust the display brightness, and can have a maximum
brightness set if needed. The BJTs are used as a [high side
switch](https://www.baldengineer.com/low-side-vs-high-side-transistor-switch.html) for the
LCD, and two bjt setup is used for safety. This allows the display to change the
brightness as the ground is connected internally in the display PCB.

<details>
<summary>Schematic</summary>
<img src="https://raw.githubusercontent.com/mwyoung/Weather-Station/master/weatherPCB/WeatherPCB.svg?sanitize=true">
</details>
<h6>&nbsp;</h6>
The PCB was purchased from JLCPCB for ~$10 including shipping, and took about 25 days to
arrive from China to the U.S.

### Software
The software used for this was the Arduino IDE, which was used for programming and sending
serial debugging hints. The included
[makefile](https://github.com/mwyoung/Weather-Station/blob/master/makefile) has a section
for launching the IDE along with creating the icons for the display.

### Darksky API
This project uses the [dark sky api](https://darksky.net/dev) as it allows up to 1000 free
api calls per day. With the current api data savings, the project uses 50 calls when
usually inactive and 100 if being constantly updated.

The current settings include updating with motion more often than when off. However, it is
still updated constantly so that if there is motion there is something to display.

The code also uses a root certificate from Darksky to remove the vulnerability of
man-in-the-middle attacks. This code can choose to not check the certificate if not
compiled with src/cert.h and the \#def USE\_CERT. This would then be more vulnerable to
attacks.

### Weather Icons
The icons used are from [erikflowers's
weather-icons](https://github.com/erikflowers/weather-icons), and then modified from svg
to bmp to a data folder. Then using the [ESP8266 data
uploader](https://github.com/esp8266/arduino-esp8266fs-plugin) is uploaded to a SPIFFS
file system. The total space for the icons is about 124 KiB of space, so it is recommended
that there is at least 1 MB of space selected in the Arduino IDE.

### Cost per year
Using a P3 P4400 [Kill A
Watt](https://www.amazon.com/P3-P4400-Electricity-Usage-Monitor/dp/B00009MDBU) meter, the
power was measured to be about 0.8W when the display is active, 1.0W when getting data,
and 0.4W when off. The same current was found to be about 80mA when getting data.

For overall cost, at the average energy rate of [13.19 cents/kWh (as of Aug
2019)](https://web.archive.org/web/20191020031839/https://www.electricchoice.com/electricity-prices-by-state/)
over a year (365 day \* 24 hours = 8760 hours) would be about (1.0W * 8760 hours)/1000 \*
13.19 cents = $1.16.

While this can be reduced by turning off the WiFi introduces a new problem of when the
weather station is far away from the WiFi router takes time (up to 30 seconds) to
establish a connection. Therefore, the code does not disconnect wifi but uses a
power-saving mode instead.

### Helpful links
[Bodmer's DarkSkyWeather](https://github.com/Bodmer/DarkSkyWeather) is a very good
resource for a ESP8266 weather station.
[BearSSL_Validation](https://github.com/esp8266/Arduino/blob/master/libraries/ESP8266WiFi/examples/BearSSL_Validation/BearSSL_Validation.ino)
is a good resource for including a root certification into a project.
