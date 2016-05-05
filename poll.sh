URL=$1
RESPONSE=$(curl -s --head $URL | head -n 1 | grep -c "HTTP/1.1 200 OK"   )
if [ $RESPONSE == 1 ]
  then
    echo $URL
    exit 1
  else
    echo "not done"
fi
sleep 10
