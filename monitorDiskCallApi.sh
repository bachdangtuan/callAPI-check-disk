#!/bin/bash

URL_API='http://10.0.50.99:8000'


for ((i=0; i<${#filesystem[@]}; i++)); do
    curl -X POST $URL_API/api/check-disk/virtual-disk \
    -H "Content-Type: application/json" \
    -d '{
        "belongToVirtualMachine": 2,
        "file_system": "'"${filesystem[$i]}"'",
        "size": "'"${size[$i]}"'",
        "used": "'"${used[$i]}"'",
        "available": "'"${available[$i]}"'",
        "use%": "'"${usePer[$i]}"'"
        }'
done
