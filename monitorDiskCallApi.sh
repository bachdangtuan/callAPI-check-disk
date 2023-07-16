#!/bin/bash

URL_API='http://10.0.50.99:8000'

ip=192.168.10.230
passServer='Isofh#is0fh@2023*'
username='isofh'
pathscript='isofh'
idMayAo=523

ketqua=$(sshpass -p $passServer ssh $username@$ip "cd /home/${pathscript}/check-partition-disk && bash checkdisk.sh")
# Đọc kết quả
readarray -t result_array <<< "$ketqua"

filesystem=${result_array[0]}
size=${result_array[1]}
used=${result_array[2]}
available=${result_array[3]}
usePer=${result_array[4]}




echo '----Disk Partition Check----'
     arrFilesystem=($(echo "$filesystem" | cut -d " " -f 1-))
     arrSize=($(echo "$size" | cut -d " " -f 1-))
     arrUsed=($(echo "$used" | cut -d " " -f 1-))
     arrAvailable=($(echo "$available" | cut -d " " -f 1-))
     arrUsePer=($(echo "$usePer" | cut -d " " -f 1-))

for ((i=0; i<${#arrFilesystem[@]}; i++)); do
    curl -X POST $URL_API/api/check-disk/virtual-disk \
    -H "Content-Type: application/json" \
    -d '{
        "belongToVirtualMachine": "'"${idMayAo[$i]}"'",
        "file_system": "'"${arrFilesystem[$i]}"'",
        "size": "'"${arrSize[$i]}"'",
        "used": "'"${arrUsed[$i]}"'",
        "available": "'"${arrAvailable[$i]}"'",
        "use_percentage": "'"${arrUsePer[$i]}"'"
        }'
done
