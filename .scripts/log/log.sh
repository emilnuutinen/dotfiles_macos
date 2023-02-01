#!/bin/sh

# current week as filename
filename=log_w$(gdate "+%V").md

# current year
year=$(gdate "+%Y")

# year last monday (if year changes mid week)
year_last_monday=$(gdate -d "last monday" +"%Y")

# get this weeks weekdays and their gdates
mon=$(gdate --date="today" +"%a %d-%m-%Y")
tue=$(gdate --date="next Tuesday" +"%a %d-%m-%Y")
wed=$(gdate --date="next Wednesday" +"%a %d-%m-%Y")
thu=$(gdate --date="next Thursday" +"%a %d-%m-%Y")
fri=$(gdate --date="next Friday" +"%a %d-%m-%Y")

# whole path to file
path=~/notes/work/turkunlp/logs/$year/$filename

# whole path to file if you open it mid week
path_last_monday=~/notes/work/turkunlp/logs/$year_last_monday/$filename

# current weekday
today=$(gdate +"%A")

if [ $today == "Monday" ]; then
    if [ -f "$path" ]; then
        nvim $path;
    else
        printf "## $mon\n\n\n\n## $tue\n\n\n\n## $wed\n\n\n\n## $thu\n\n\n\n## $fri\n\n\n\n" >> $path; nvim $path;
    fi
elif [ $today != "Monday" ]; then
    nvim $path_last_monday;
fi
