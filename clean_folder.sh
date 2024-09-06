#!/bin/bash

folder="$1"
filetype="$2"
max="$3"

find $folder/*$filetype -maxdepth 0 -type f -exec stat -c "%Y %n" {} \; | sort -nr | awk "NR > $max {print $2}" | xargs rm -rf
