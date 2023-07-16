#!/bin/bash

URL_API='http://10.0.0.210:8000'

ip=10.0.0.20
passServer='Isofh#is0fh@2023*'
username='isofh'
pathscript='isofh'
idMayAo=1

ketqua=$(sshpass -p $passServer ssh $username@$ip "cd /home/${pathscript}/checkdiskpartition && bash checkpartitiondisk.sh")
# Đọc kết quả
readarray -t result_array <<< "$ketqua"

filesystem=${result_array[0]}
size=${result_array[1]}
used=${result_array[2]}
available=${result_array[3]}
usePer=${result_array[4]}

echo $filesystem

echo '----Disk Partition Check----'

arrFilesystem=()
read -ra arrFilesystem <<< "$filesystem"
arrSize=($(echo "$size" | cut -d " " -f 1-))
arrUsed=($(echo "$used" | cut -d " " -f 1-))
arrAvailable=($(echo "$available" | cut -d " " -f 1-))
arrUsePer=($(echo "$usePer" | cut -d " " -f 1-))

echo "----Disk Partition Check----"
for ((i=0; i<${#arrFilesystem[@]}; i++)); do
    echo "Filesystem: ${arrFilesystem[$i]}"
    echo "Size: ${arrSize[$i]}"
    echo "Used: ${arrUsed[$i]}"
    echo "Available: ${arrAvailable[$i]}"
    echo "Use Percentage: ${arrUsePer[$i]}"

   curl -X POST $URL_API/api/check-disk/virtual-disk \
   -H "Content-Type: application/json" \
   -d '{
       "belongToVirtualMachine": "'"${idMayAo}"'",
       "file_system": "'"${arrFilesystem[$i]}"'",
       "size": "'"${arrSize[$i]}"'",
       "used": "'"${arrUsed[$i]}"'",
       "available": "'"${arrAvailable[$i]}"'",
       "use_percentage": "'"${arrUsePer[$i]}"'"
   }'

done
