#!/bin/bash
function send(){

	echo "Intruder Detected at $(date) -> Distance: $1" | mutt -s "Root Intruder Detected " <your_email@dotcom.hue> 

}
if [ $# -lt 1 ] 
	echo "[*] - Usage: 
			$0 /dev/ttyXXX"
	exit 1
else
	stty -F $1 raw
	stty -F $1 -echo
	while read -rs -n 1 c && [[ $c != 'q' ]]
	do
		if [ $(echo $c | wc -c )  -eq 0  ];then
				break
			elif [ $c != '\r' ];then
				string=$string+$c
			else
				move = $( echo $string | tr -d '+')
				send $move & 
				echo $move
				string=''
				
		fi

	done < $1
fi
