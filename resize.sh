#!/usr/bin/env bash

smartresize() {
    # From https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

shopt -s nullglob
mkdir newimgs
for file in imgs/*.jpg; do
    smartresize "$file" 1200 newimgs
done
cp imgs/*.png newimgs
rm -R imgs
mv newimgs imgs
