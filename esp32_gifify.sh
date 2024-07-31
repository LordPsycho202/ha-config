#!/bin/bash

framerate=$1
input=$2
output=$3

find * -maxdepth 0 -type f -not -name "Thumbs.db" | sort -nr | awk 'NR > 30 {print $2}' | xargs rm -rf
ffmpeg -loglevel 8 -r $framerate -f image2 -y -pattern_type glob -i $input $output

