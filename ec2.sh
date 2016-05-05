#!/bin/bash

APP=$1
NUMSERVERS=$2
SIZE=$3

COMMAND="aws ec2 run-instances  --image-id ami-be5cf7cd --count $NUMSERVERS  --user-data file://$APP --instance-type '$SIZE'  "
echo $COMMAND
eval $COMMAND | jq .Instances>last_run
IP=$(aws ec2 describe-instances --instance-ids $(cat last_run | jq .[0].InstanceId | awk -F '"' '{print $2}') | jq .Reservations[0].Instances[0].NetworkInterfaces[0].PrivateIpAddresses[0].Association.PublicIp)
IP=$(echo $IP | awk -F '"' '{print $2}')
URL=$(echo $IP:8000)
echo $URL
echo "while true;do bash ./poll.sh $URL; done"
