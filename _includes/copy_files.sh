#!/bin/bash

files=(~/.vimrc ~/.config/i3/{config,touchpad.sh})

for i in ${files[@]}; do
    echo "cp $i to ."
    cp "$i" .
done
