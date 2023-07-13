#!/bin/bash

URL_API='http://10.0.50.99:8000'

ip=10.0.0.20
passServer='Isofh#is0fh@2023*'
username='isofh'
pathscript='isofh'
idMayAo=1
# Isofh
isofh8=1
isofh89=2
isofh92=3
isofh119=4
isofh248=5
isofh250=6
isofh252=7
isofh254=8
# Viện E
bve70=9
bve254=10
# Medi
medi91=11
medi92=12
medi93=13
medi94=14
# SanhPhon
xanhphon10=15
xanhphon11=16
xanhphon12=17
# DKTH
dkth53=18
dkth54=19
dkth56=20
dkth11=21
dkth12=22
dkth13=23
# Phoi
phoi249=24
phoi250=25
phoi252=26
phoi254=27
# DHY
dhy165=28
dhy167=29
dhy181=30
# TTTM
tttm233=31
tttm234=32
# TA
ta104=33
# YTCC
ytcc2121=34
ytcc2123=34
# YKHN
ykhn104=36

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
        "belongToVirtualMachine": 2,
        "file_system": "'"${arrFilesystem[$i]}"'",
        "size": "'"${arrSize[$i]}"'",
        "used": "'"${arrUsed[$i]}"'",
        "available": "'"${arrAvailable[$i]}"'",
        "use%": "'"${arrUsePer[$i]}"'"
        }'
done
