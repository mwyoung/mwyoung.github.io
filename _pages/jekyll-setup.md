---
layout: post
title: "Jekyll Setup"
date: 2020-06-01
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
The only gem needed for jekyll is `github-pages`, which can be installed with
 `gem install github-pages`. Updates can be checked with `gem outdated` and updated with
`gem update github-pages`. System updates may be necessary with
 `sudo gem update --system`. If the .gemrc file doesn't work, include the switch
`--user-install` with the update command.

Ruby should also be updated with `gem update`. If one gem fails to install (an error could
be *failed to build gem native extension*), this then could be solved by manually
installing the gem that failed (like *etc*).

A makefile is also included to launch jekyll along with having different methods like a
debug or mobile mode (using `make`, `make build-debug`, or `make build-mobile`).

### Pages
This jekyll setup uses a collection titled pages so that there is the advantages of only
having a folder with titles as file names, and in each file having a date that can be
changed in order to sort each page.

Therefore, this allows the usage of post-like content while using pages and allows it to
be sortable by date updated in [pages]({{ '/pages/' | relative_url }}). This allows no
year, month, or day to be shown in the url or file, and allows the date to easily be
changed.

### Including code
Using markdown and a `_includes/` folder allows the use of embedding code from a file that
can be updated. An example of this is used in this webpage as the .gemrc and in the bash
script below in webcrawlers. Jekyll also provides syntax highlighting with rouge
(`ruby install rouge`) which can create [css
styles](https://help.github.com/en/github/working-with-github-pages/about-github-pages-and-jekyll#syntax-highlighting)
for a website.
{% highlight shell %}
{% include syntax_highlight.sh %}
{% endhighlight %}

There are two ways for showing code. One allows both markdown and html, the other uses
only [html](https://caniuse.com/#feat=details) but can hide the code.

<table>
    <tr>
        <th>markdown/html</th>
        <th>html only</th>
    </tr>
    <tr>
        <td>
#### **`example`**<br>
```<i>code type</i><br>
{% raw %}{% include file.ext %}{% endraw %} <br>
```
        </td>
        <td>
&lt;details&gt;<br>
&lt;summary&gt;example&lt;/summary&gt;<br>
{% raw %}
{% highlight <i>code type</i> %}<br>
{% include file.ext %}<br>
{% endhighlight %}<br>
{% endraw %}
&lt;/details&gt;
        </td>
    </tr>
    <tr>
        <td>
<div markdown="1">
#### **`example`**
```
{% include file.ext %}
```
</div>
        </td>
        <td>
<details>
<summary>example</summary>
{% highlight shell %}
include code
{% endhighlight %}
</details>
        </td>
    </tr>
</table>


Note: In markdown each symbol is commented out with \, the jekyll syntax is commented
with [raw and
endraw tags](https://stackoverflow.com/questions/20568396/how-to-use-jekyll-code-in-inline-code-highlighting),
and the html is commented out by substituting &amp;lt; for < and &amp;gt; for > (&
substitues as &amp;amp;). Also, when including files in markdown, there is an extra
newline added at the end of each file unlike when using html.

To use markdown inside html, the tag &lt;div markdown="1"&gt; markdown code...
&lt;div&gt; can be used.

### Mobile
For mobile testing (`make build-mobile` using [responsive
design](https://developers.google.com/web/fundamentals/design-and-ux/responsive)) make
sure the firewall excepts outside calls. If the firewall `ufw` is active, this will
prevent the webpage from being shared over the local network. Running the command
`sudo ufw allow 4000` will allow others to view the network. More information about ufw
can be found
[here](https://sashabrava.github.io/2018/making-Jekyll-available-on-local-network.html).

### Webcrawlers
There needs to be enough content for Google to actually crawl the website, along with
taking some time to do so. The
[sitemap](https://jekyllrb.com/tutorials/convert-site-to-jekyll/#11-add-a-sitemap) for
this website is located [here](/sitemap.xml) (and a [robots.txt](/robots.txt) or in jekyll
format [here](https://github.com/mwyoung/mwyoung.github.io/blob/master/sitemap.xml)). In
order for search engines to locate the webpage, a [bash
script](https://github.com/mwyoung/mwyoung.github.io/blob/master/_code/ping.sh) is used to
ping Google and Bing.

It can also be helpful to add a [lastmod](https://www.sitemaps.org/protocol.html) to let
search engines know when a page was last updated. The format that should be used is [W3C
Datetime](https://www.w3.org/TR/NOTE-datetime) (ISO 8601), and can be [created in jekyll
liquid](http://alanwsmith.com/jekyll-liquid-date-formatting-examples)  for the sitemap as
{% raw %}{{ page.date | date "%Y-%m-%d }}{% endraw %}. Another part of the format would be
to have the urls go from newest to oldest, and as such the jekyll format for loop could
just have a reversed keyword in it.

<details>
<summary>ping.sh (Google/Bing)</summary>
{% highlight shell%}
{% include ping.sh %}
{% endhighlight %}
</details>
<h6>&nbsp;</h6>

### Javascript and Tracking
This website doesn't use javascript (but does use some newish HTML5 features). It also
includes no tracking for the privacy aware.

### 404
A good 404 page build guide is available in the [jekyll docs](https://jekyllrb.com/tutorials/custom-404-page/).
It can be viewed [here]({% link 404.md %}).

### Other references
[SO - Google Webcrawler](https://stackoverflow.com/questions/10376009/how-send-to-google-ping-after-add-new-post/13989836#13989836),
[Medium - CSS Footer](https://medium.com/@paynoattn/flexbox-sticky-footer-d19dab50c34),
[Hiding pages from page list](https://mycyberuniverse.com/exclude-pages-from-navigation-menu-in-jekyll.html),
[Quackit - details tag](https://www.quackit.com/html_5/tags/html_details_tag.cfm), and
[Jekyll tags](https://longqian.me/2017/02/09/github-jekyll-tag/).
