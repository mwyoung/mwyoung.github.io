#!/bin/bash

# check if webpage exists, don't donwload
ping_tool="wget --spider"
site_map="https://mwyoung.github.io/sitemap.xml"

declare -a se_array=("http://www.google.com/ping?sitemap=" \
    "http://www.bing.com/webmaster/ping.aspx?siteMap=")

for i in "${se_array[@]}"; do
    echo "====================="
    echo $ping_tool $i$site_map
    echo "====================="
    eval $ping_tool $i$site_map
done
