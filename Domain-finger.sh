file_name=$1

fingerprint(){
        echo $(cut $file_name -d "." -f 1 | sort -u)
}

if [ -f "$file_name" ];then
        fingerprint
else
        echo "$file_name does not exist."
fi
