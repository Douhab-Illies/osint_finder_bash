#!/bin/bash



if [[ "$1" -eq "" ]];then
	echo "./osint_finder.sh [username]"
fi


USERNAME="$1"


for i in $(cat ./list);do
	URL=$(echo $i | sed -e "s/REPLACE/$USERNAME/g")
	CODE_REQ=$(curl -s -o /dev/null -w  "%{http_code}\n" $URL);
	if [[ "$CODE_REQ" == "200" ]];then
		echo "[+] $URL"
	fi

done
