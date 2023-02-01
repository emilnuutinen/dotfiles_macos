#!/bin/sh

# filename
filename=weekly_w$(gdate -d "last week" "+%V").md

# current year
year=$(gdate -d "last monday" "+%Y")

# whole path
path=~/notes/personal/reflections/$year/weekly/$filename

# file extension
extension="${filename##*.}"

if [ -f "$path" ]; then
    nvim $path;
else
   cp -n ~/.scripts/weekly/weekly_template.md $path; nvim $path;
fi
