#!/usr/bin/env bash

# WHY AM I DOING THIS
urlencoder() {
    #variables
    local s=$1 out='' c hex i

    #LC_ALL=C force the use of english/ASCII or something, why am I learning about this for a joke
    LC_ALL=C
    for (( i  = 0; i<${#s}; i++ )); do
        c=${s:i:1}
        case $c in
            [a-zA-Z0-9.~_-]) out+=$c ;;
            # note the $'c why? to return the decimal value, %% -> % and %020X -> dec to hex
            *) printf -v hex '%%%02X' "'$c";
                out+=$hex ;;
        esac
    done
    printf '%s' "$out"
    }


if [ -z "$1" ]; then
    read -r -p "What would you like to search? " query
else
    query="$*"
fi

xdg-open https://www.bing.com/search?q=$(urlencoder "$query")"



