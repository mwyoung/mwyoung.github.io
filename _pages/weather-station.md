---
layout: post
title: "Weather Station"
date: 2019-09-29
---
Note: code for this project is available
[here](https://github.com/mwyoung/Weather-Station).

### Project Goals
The goals for this project include a weather station that is easy to view along with
containing lots of information about the current weather.

### Hardware
The hardware for this project includes an [ESP8266 WeMos D1
Mini](https://wiki.wemos.cc/products:d1:d1_mini)

### Software

### Darksky API
This project uses the [dark sky api](https://darksky.net/dev) as it allows up to 1000 free
api calls per day. With the current api data savings, the project uses 50 calls when
usually inactive and 100 if being constantly updated.

The current settings include updating with motion more often than when off. However, it is
still updated constantly so that if there is motion there is something to display.

There is also a security risk as it does not use encryption to call the api. However,
since the only data being transmitted in GPS coordinates (which can be set to be a bit off
in location) and json being received means there is a low risk to it being compromised.

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
