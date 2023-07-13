#!/bin/bash

URL_API='http://10.0.50.99:8000'

ip=10.0.0.20
passServer='vailozthenhi'
username='root'
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
# readarray -t result_array <<< "$ketqua"

echo $ketqua

# for ((i=0; i<${#filesystem[@]}; i++)); do
#     curl -X POST $URL_API/api/check-disk/virtual-disk \
#     -H "Content-Type: application/json" \
#     -d '{
#         "belongToVirtualMachine": 2,
#         "file_system": "'"${filesystem[$i]}"'",
#         "size": "'"${size[$i]}"'",
#         "used": "'"${used[$i]}"'",
#         "available": "'"${available[$i]}"'",
#         "use%": "'"${usePer[$i]}"'"
#         }'
# done
