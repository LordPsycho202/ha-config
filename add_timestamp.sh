#!/bin/bash

file="$1"
timestamp="$2"

font="/config/www/fonts/antonio.ttf"

echo "Timestamp: $timestamp"
echo "File: $file"

ffmpeg -i $file -y -vf "drawtext=fontfile=$font: text='$timestamp': x=(w-tw): y=0: fontcolor=white: box=1: boxcolor=0x00000000@1: fontsize=30" $file
#ffmpeg -vf "drawtext=fontfile=$font: text=$timestamp: x=(w-tw): y=0: fontcolor=white: box=1: boxcolor=0x00000000@1: fontsize=30" -y -i $file $file
