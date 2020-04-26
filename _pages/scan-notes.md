---
layout: post
title: "Deskewing Scanned Notes"
date: 2019-12-23
---

### Introduction

The most recent version of this scrip is located
[here](https://github.com/mwyoung/Dotfiles/blob/master/Scripts/deskew.sh).

One nice way to save old notes is to scan them to a PDF. However, not all scanners make
the notes correctly orientated along with also taking up a lot of space.  There are
several methods to make notes look better like
[unpaper](https://github.com/Flameeyes/unpaper) or
[pdfsandwich](http://www.tobias-elze.de/pdfsandwich/). It is also possible to enhance
notes such as using [mzucker's noteshrink
approach](https://mzucker.github.io/2016/09/20/noteshrink.html) or use ImageMagick to do
the conversion such as [lelandbatey's whiteboard
cleaner](https://gist.github.com/lelandbatey/8677901), but this last method can be quite
slow on single images.

This solution mostly focuses on black and white notes, and can be changed to use color. It
can shrink a pdf to about 20% of its size depending on how many lines there are on the
page. It can also deskew notes that unpaper can not deskew, and can be modified very
easily.

### Examples

<style type='text/css'>/*For image size*/
img.note_img { max-width: 100%; display: block; margin: 0 auto; }
</style>

<div class="note_img">
<img style="max-height:150px"
src="https://user-images.githubusercontent.com/10273995/71450719-1437f300-271c-11ea-85f2-5ef81067001b.jpg">
<img style="max-height:150px"
src="https://user-images.githubusercontent.com/10273995/71450718-1437f300-271c-11ea-8eeb-25d9d2d5edc9.png">
</div>
The image on the left is the original image (JPG 210.4 KiB, PNG 680.9 KiB) and the image
on the right is the deskewed image (PNG 171.9 KiB). The image to PDF method (img2pdf) only
adds an additional 500 to 700 Bytes to the overall file size, and as such does not reduce
the image quality (unlike ImageMagick).

Another example is when using the dark border removal, which happens when the background
of the scanner uses black instead of white.

<div class="note_img">
<img style="max-height:110px"
src="https://user-images.githubusercontent.com/10273995/71450721-1437f300-271c-11ea-81b3-5406a9623537.jpg">
<img style="max-height:110px"
src="https://user-images.githubusercontent.com/10273995/71450720-1437f300-271c-11ea-8b87-8fab4e0ce206.png">
</div>

Like the first example, the image on the left is the original image (JPG 354.5 KiB, PNG
1.6 MiB) and the image on the right is the converted image (PNG 44.0 KiB).

### Running deskew.sh

This script uses bash, mktemp (from coreutils), pdfinfo and pdftoppm (from poppler-utils),
convert (from imagemagick), img2pdf, gs (from ghostscript), and exiftool (from
libimage-exiftool-perl).

This tool also comes with several command line switches, along with defaults used when the
switch is not present.
* -b is the amount of [offset in
  pixels](https://imagemagick.org/script/command-line-options.php#lat) to change. The
default is 5.
* -d is the dpi that will be used on the PDFs. The default is 325.
* -h is the help menu.
* -p is the PDF [image file format](https://en.wikipedia.org/wiki/Netpbm_format) used for
  each image. The default is pgm (gray).
* -o signifies the output file. By default, the original file has \_skew added to the end
  of the file and the new file named after the original file.
* -r creates a 1 pixel black border, and then changes any black pixels linked to that
  border to white.

<details>
<summary>deskew.sh</summary>
{% highlight shell %}
{% include deskew.sh %}
{% endhighlight %}
</details>
