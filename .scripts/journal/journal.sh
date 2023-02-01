#!/bin/sh

# current week as filename
journal_filename=journal_w$(gdate "+%V").md

# current year
year=$(gdate "+%Y")

# year last monday (if year changes mid week)
year_last_monday=$(gdate -d "last monday" +"%Y")

# get this weeks weekdays and their dates
mon=$(gdate --date="today" +"%a %d-%m-%Y")
tue=$(gdate --date="next Tuesday" +"%a %d-%m-%Y")
wed=$(gdate --date="next Wednesday" +"%a %d-%m-%Y")
thu=$(gdate --date="next Thursday" +"%a %d-%m-%Y")
fri=$(gdate --date="next Friday" +"%a %d-%m-%Y")
sat=$(gdate --date="next Saturday" +"%a %d-%m-%Y")
sun=$(gdate --date="next Sunday" +"%a %d-%m-%Y")

# whole path to file
journal_path=~/notes/personal/journal/$year/$journal_filename

# whole path to file if you open it mid week
journal_path_last_monday=~/notes/personal/journal/$year_last_monday/$journal_filename

# current weekday
today=$(gdate +"%A")

if [ $today == "Monday" ]; then
    if [ -f "$journal_path" ]; then
        nvim $journal_path; 
    else
        printf "## $mon\n\n- [ ] Weekly journal\n\n## $tue\n\n\n\n## $wed\n\n\n\n## $thu\n\n\n\n## $fri\n\n\n\n## $sat\n\n\n\n## $sun\n\n\n## Next week\n\n\n" >> $journal_path; nvim $journal_path;
    fi
elif [ $today != "Monday" ]; then
    nvim $journal_path_last_monday;
fi
