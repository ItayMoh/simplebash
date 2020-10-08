#!/bin/bash

file_name=$1

fingerprint(){
        echo -e "\n $(cut $file_name -d '/' -f 3 | tr '.' '\n' | grep -v -e "com" -e "www | sort -u)"
}

if [ -f "$file_name" ];then
        fingerprint
else
        echo "$file_name does not exist."
fi
