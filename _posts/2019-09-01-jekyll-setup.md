---
layout: post
title: "Jekyll Setup"
---
## Overall Setup
This Jekyll setup used several guides, including
[Archwiki - ruby setup](https://wiki.archlinux.org/index.php/Ruby),
[kbroman - gem testing](https://kbroman.org/simple_site/pages/local_test.html),
[jmcglone - overall setup](http://jmcglone.com/guides/github-pages/),
[jekyllrb - post setup](https://jekyllrb.com/docs/step-by-step/08-blogging/),
[SO - Google Webcrawler](https://stackoverflow.com/questions/10376009/how-send-to-google-ping-after-add-new-post/13989836#13989836),
[Medium - CSS Footer](https://medium.com/@paynoattn/flexbox-sticky-footer-d19dab50c34),
for a Ubuntu based machine to test before deploying to Github Pages.

For Ruby, a local install option was used.

Note: there needs to be enough content for Google to actually crawl the website, along
with taking some time to do so. The sitemap for this website is located
[here](/sitemap.xml).

### Mobile
For mobile testing ([responsive design](https://developers.google.com/web/fundamentals/design-and-ux/responsive)), make
sure the firewall excepts outside calls. Using the information
[here](https://sashabrava.github.io/2018/making-Jekyll-available-on-local-network.html),
allowing the rule `sudo ufw allow 4000` allows other people on the network to access the
page.

### 404
A good 404 page build guide is available in the [jekyll docs](https://jekyllrb.com/tutorials/custom-404-page/).
It can be viewed [here]({% link 404.md %}).
