file_name=$1

fingerprint(){
        echo -e "\n $(cut $file_name -d '.' -f 1 | sort -u | tr  -s '\t' '\n')"
}

if [ -f "$file_name" ];then
        fingerprint
else
        echo "$file_name does not exist."
fi
