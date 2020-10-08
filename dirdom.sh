#!/bin/bash

file_name=$1
flag=$2

fingerprint(){
        echo -e "\n $(cut -d '/' -f 3  $file_name | tr -s '.' '\n' | grep -v -e "www" -e "com" | sort -u )"
}

dir(){
        echo -e "\n $(cut $file_name -d '/' -f 4- |tr -s '/' '\n' | grep -v -e "gif" -e "png" -e "jpg" -e "pdf" -e "css" -e "com" | cut -d '?' -f 1)" | cut -d ';' -f 1| cut -d "%" -f 1 | cut -d "=" -f 1 | sort -u
}


if [ -f "$file_name" ];then
        echo "proccessing"
else
        echo "$file_name does not exist."
        exit 1
fi

if [ $# != 2 ];then
        echo "You did not provide 2 arguments -p for path -d for domains";
        exit 1
fi

if [ "$flag" == "-d" ];then
        fingerprint;
elif [ "$flag" == "-p" ];then
        dir;
else
        echo "please use -p for path or -d for domains"
fi
