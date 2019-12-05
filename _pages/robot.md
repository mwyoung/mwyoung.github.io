---
layout: post
title: "ROS Robot"
date: 2019-06-01
---
## Introduction
This project was for Oregon State University's ROB 421/521 class on robots. The overall
goal of the project was to be able to build a [cornhole
robot](https://github.com/mwyoung/Cornhole-Robot) that could launch bean bags into a hole,
along with [document progress in a
website](https://sites.google.com/view/advanced-robotics-team-13/home).

The main people who worked on this project were Sridhar Thiagarajan, Ashwin Vinoo and
Miles Young. Sridhar and Ashwin focused on the mechanical parts and some of the electrical
work, while Miles focused on the electronics, code, wireless teleoperation,
microcontrollers, and sensors.

An example of this robot in action is available [as a gif (9 MiB
file)](https://user-images.githubusercontent.com/10273995/70187746-d4916480-16a3-11ea-97c9-25539110e745.gif)
or [on Google
Drive](https://drive.google.com/file/d/1d2ZNT2PElxMqfjijd-8yuyTfzLbTILos/view).

## Robot Images
<style type='text/css'>/*For image size*/
img.robot_img { max-width: 100%; display: block; margin: 0 auto; }
</style>

<div class="robot_img">
<img style="max-height:200px"
src="https://user-images.githubusercontent.com/10273995/66241697-769ccc80-e6b4-11e9-9a8b-a6163051fe13.png">
<img style="max-height:200px"
src="https://user-images.githubusercontent.com/10273995/66241586-43f2d400-e6b4-11e9-9e96-78835701c3eb.png">
</div>

<div class="robot_img">
<img style="max-height:300px"
src="https://user-images.githubusercontent.com/10273995/66241764-a21fb700-e6b4-11e9-8986-49fc4554fb28.jpg">
<img style="max-height:300px"
src="https://user-images.githubusercontent.com/10273995/66241793-b368c380-e6b4-11e9-8551-4361d78eaa32.jpg">
</div>

## UI/Schematic

### UI demo
<img class="robot_img"
src="https://user-images.githubusercontent.com/10273995/66241848-e14e0800-e6b4-11e9-884d-53417e59a37e.jpg">
This demo is about a general view that the operator could see when operating the robot.

<img class="robot_img"
src="https://user-images.githubusercontent.com/10273995/66241846-e0b57180-e6b4-11e9-8af3-7fda18800037.gif">
The launching demo goes through each step of the beanbag launching setup automatically.

<img class="robot_img"
src="https://user-images.githubusercontent.com/10273995/66241844-e0b57180-e6b4-11e9-875a-569e38a6b048.gif">
The sonar demo shows when objects are detected in the front (red), back (yellow), both
(orange), and no objects (blue) for the operator.

### Schematic
<details>
<summary>Schematic</summary>
<img class="robot_img"
src="https://user-images.githubusercontent.com/10273995/66241845-e0b57180-e6b4-11e9-945b-cfb7dfbfe611.png">
</details>

## Software Setup
<details>
<summary>ROS setup instructions</summary>
{% capture ros-setup %}{% include ros-instructions.md %}{% endcapture %} {{ ros-setup |
markdownify }}
</details>
