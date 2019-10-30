---
layout: post
title: "Jekyll Setup"
date: 2019-10-02
---
## Overall Setup
This Jekyll setup used several guides, including
[Archwiki - ruby setup](https://wiki.archlinux.org/index.php/Ruby),
[kbroman - gem installation](https://kbroman.org/simple_site/pages/local_test.html),
[jmcglone - overall setup](http://jmcglone.com/guides/github-pages/),
[jekyllrb - post setup](https://jekyllrb.com/docs/step-by-step/08-blogging/),
for a Ubuntu based machine to test before deploying to Github Pages.

### Ruby Setup
For Ruby, a local install option was used. In particular, a .gemrc file was created along
with `$(ruby -e 'puts Gem.user_dir')/bin`. This places all of the gems into a `~/.gem`
folder.

#### **`.gemrc`**
```shell
{% include .gemrc %}
```
The only gem needed for jekyll is `github-pages`, which can be installed with `gem install
github-pages`. Updates can be checked with `gem outdated` and updated with `gem update
github-pages`. System updates may be necessary with `sudo gem update --system`.

A makefile is also included to launch jekyll along with having different methods like a
debug or mobile mode (using `make`, `make build-debug`, or `make build-mobile`).

### Pages
This jekyll setup uses a collection titled pages so that there is the advantages of only
having a folder with titles as file names, and in each file having a date that can be
changed in order to sort each page. Therefore, this allows the usage of post-like content
while using pages and allows it to be sortable by date updated in [pages]({{ '/pages/' |
relative_url }}). This allows no year, month, or day to be shown in the url or file, and
allows the date to easily be changed.

### Including code
Using markdown and a `_includes/` folder allows the use of embedding code from a file
that can be updated. An example of this is used in this webpage as the .gemrc and in the
bash script below in webcrawlers.

An example of this in markdown code would be:

\#\#\#\# \*\*\`file.ext\`\*\*<br>
\`\`\`file ext, optional<br>
\{\% include file.ext \%\}<br>
\`\`\`

### Mobile
For mobile testing (`make build-mobile` using [responsive
design](https://developers.google.com/web/fundamentals/design-and-ux/responsive)) make
sure the firewall excepts outside calls. If the firewall `ufw` is active, this will
prevent the webpage from being shared over the local network. The command `sudo ufw allow
4000` will allow others to view the network. More information about ufw can be found
[here](https://sashabrava.github.io/2018/making-Jekyll-available-on-local-network.html).

### Webcrawlers
There needs to be enough content for Google to actually crawl the website, along with
taking some time to do so. The
[sitemap](https://jekyllrb.com/tutorials/convert-site-to-jekyll/#11-add-a-sitemap) for
this website is located [here](/sitemap.xml), with an example bash script located
[here](https://github.com/mwyoung/mwyoung.github.io/blob/master/_code/ping.sh) or shown
below.

#### **`ping.sh`**
```shell
{% include ping.sh %}
```

### 404
A good 404 page build guide is available in the [jekyll docs](https://jekyllrb.com/tutorials/custom-404-page/).
It can be viewed [here]({% link 404.md %}).

### Other references
[SO - Google Webcrawler](https://stackoverflow.com/questions/10376009/how-send-to-google-ping-after-add-new-post/13989836#13989836),
[Medium - CSS Footer](https://medium.com/@paynoattn/flexbox-sticky-footer-d19dab50c34),
[Hiding pages from page list](https://mycyberuniverse.com/exclude-pages-from-navigation-menu-in-jekyll.html), and
[Jekyll tags](https://longqian.me/2017/02/09/github-jekyll-tag/).
