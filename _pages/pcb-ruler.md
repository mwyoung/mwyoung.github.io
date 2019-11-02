---
layout: post
title: "PCB Ruler"
date: 2019-10-10
---

Note: code for this project is available
[here](https://github.com/mwyoung/Adafruit-PCB-Ruler).

<style type='text/css'>/*For image size*/
img.ruler_img { max-width: 100%; max-height: 300px; display: block; margin: 0 auto; }
</style>

### Project Goals
The main goals of this project was to create a ruler with more footprints than the
[Adafruit PCB Ruler](https://github.com/adafruit/Adafruit-PCB-Ruler) it was based on. This
design also is only 101mm in length so that it can be built very cheaply at PCB
manufactures such as JLCPCB.

Please also note that this ruler is **for reference only**, and should not be used for
precise measurements. Finally, like the Adafruit ruler it is under a CC BY-SA 3.0 license.

### Changes
The major changes compared to Version 1 (below) is that all of the parts used come from
either KiCad built-in libraries or KiCad online libraries
([Jumper.pretty](https://github.com/mwyoung/Adafruit-PCB-Ruler/tree/master/Jumper.pretty)
and
[Package_BGA.pretty](https://github.com/mwyoung/Adafruit-PCB-Ruler/tree/master/Package_BGA.pretty),
with update scripts for the latest version included).

Other changes include reformatting the drill holes to go up every 2 interval, parts, the
scales, a schematic for adding parts easier, and tying all of the pin 1s together to make
it easier to distinguish which one is which. The ruler now has inches in both 1/10 and
1/16 along with 100mm along with a protractor with 15° markers. Finally, there is more
resistors, diodes, transistors, QF\* and BGA parts on the ruler along with 1 to 2.54 mm
holes for pins.

### Images
<img class="ruler_img"
src="https://user-images.githubusercontent.com/10273995/67438237-c978ee00-f5a7-11e9-986b-de8059c62ba9.png">
<img class="ruler_img"
src="https://user-images.githubusercontent.com/10273995/67438236-c978ee00-f5a7-11e9-9059-d458f1a74493.png">

Note: JLCJLCJLCJLC option is for JLCPCB to place the text of the printing. If using this
supplier, make sure the board is 1.6mm is width so it does not bend, and can also be added
onto another order for ~$4 for 5 PCB rulers.

### Version 1
The [first version](https://github.com/mwyoung/Adafruit-PCB-Ruler/tree/v1-ruler) of the
ruler only contains parts from the Adafruit ruler and a bit more information. It has also
been adapted to the KiCad format along with being 101mm in length. The only major changes
in this version is reorganization, moving some drill holes, and removing the Adafruit logo
(but still leaving attribution).

#### Images
<details>
<summary>Images</summary>
<img class="ruler_img"
src="https://user-images.githubusercontent.com/10273995/66705448-a1ea7180-ecdb-11e9-8590-181d0e30be9d.png">
<img class="ruler_img"
src="https://user-images.githubusercontent.com/10273995/66705447-a1ea7180-ecdb-11e9-8656-f98267c7b2f4.png">
</details>
