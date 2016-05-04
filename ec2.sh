#!/bin/bash

NUMSERVERS=$2
SIZE=$3
USER_DATA="$(cat hello_world)"

COMMAND="aws ec2 run-instances  --image-id ami-be5cf7cd --count $NUMSERVERS  --user-data '$USER_DATA' --instance-type '$SIZE'  --associate-public-ip-address"
echo $COMMAND
eval $COMMAND | jq .
