#!/bin/bash
function send(){
	streamer -t 10 -r 2 -o images/target00.jpeg
	echo "Intruder Detected at $(date) | Distance: $1" | mutt -s "Root Intruder Detected" -F .muttrc -a images/*.jpeg -- < EMAIL HERE>
}
stty -F $1 raw
stty -F $1 -echo
while read -rs -n 1 c && [[ $c != 'q' ]]
do
        if [ $(echo $c | wc -c )  -eq 0  ];then
                        echo "[!] Breaking"
                        break
                elif [ $c != '\r' ];then
                        string=$string+$c
                else
                        move=$( echo $string | tr -d '+')
                        send $move &
			echo $move
                        string=''
                fi

        done < $1
