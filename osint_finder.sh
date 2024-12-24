#!/bin/bash



if [ -z "$1" ] ;then
	echo "./osint_finder.sh [username]"
	exit
fi


USERNAME="$1"

clear

RED='\e[1;31m'
echo -e "${RED} SOME RESULTS MAY BE FALSE POSITIVES"


NOCOLOR='\033[0m'
echo -e "${NOCOLOR}"
for i in $(cat ./list);do
	URL=$(echo $i | sed -e "s/REPLACE/$USERNAME/g")
	CODE_REQ=$(curl -s -o /dev/null -w  "%{http_code}\n" $URL);
	if [[ "$CODE_REQ" == "200" ]];then
		echo "[+] $URL"
	fi

done
