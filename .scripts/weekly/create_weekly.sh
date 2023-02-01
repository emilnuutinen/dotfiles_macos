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
    echo "Weekly already created for this week.";
else
   cp -n ~/.scripts/weekly/weekly_template.md $path;
fi
