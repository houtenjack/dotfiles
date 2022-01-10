#!/bin/bash

# resizes all *.original.jpg images to be at least 1920 wide
# then it copies them to ./ready/

for i in *.original.jpg; do
    [ -f "$i" ] || break
	filename=$(echo $i | cut -d'.' -f 1)
	cp $i "./ready/$filename.jpg"
	convert "./ready/$filename.jpg" -resize 1920 "./ready/$filename.jpg"
done

