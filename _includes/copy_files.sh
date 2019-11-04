#!/bin/bash

files=(~/.vimrc ~/.config/i3/config)

for i in ${files[@]}; do
    echo "cp $i to ."
    cp "$i" .
done
