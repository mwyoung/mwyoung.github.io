---
layout: default
title: Pages
permalink: /pages/
---
<h2>All Pages</h2>
<p>
A place to keep some notes. Sorted by <b>date updated</b>.

<ul>
    {% assign sortedPage = site.pages | sort: 'date' | reverse %}
    {% for page in sortedPage %}
        {% unless page.exclude %}
            <li>
                <h3><a href="{{ page.url }}">{{ page.title }}</a></h3>
            </li>
        {% endunless %}
    {% endfor %}
</ul>
