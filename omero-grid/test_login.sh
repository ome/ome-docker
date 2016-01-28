#!/bin/bash

set -e
set -u
set -x

# Must be exported by the caller:
# OMERO_USER OMERO_PASS

WEB_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' $PREFIX-web)

LOGIN_URL="http://localhost:$WEB_PORT/webclient/login/"
SERVER="1"
URL="url=%2Fwebclient%2F"
COOKIES=cookies.txt

rm -f $COOKIES
CURL_BIN="curl -i -k -s -c $COOKIES -b $COOKIES -e $LOGIN_URL"

echo -n "Getting CRSF token "
# Retry for 2 mins
i=0
csrf_token=
while [ -z "$csrf_token" -a $i -lt 60 ]; do
    sleep 2
    $CURL_BIN $LOGIN_URL > /dev/null || true
    csrf_token=$(grep csrftoken cookies.txt | awk '{print $7}')
    echo -n "."
    let ++i
done
echo

if [ -z "$csrf_token" ]; then
    echo "Failed to get CSRF token"
    exit 2
fi

echo "CSRF token: $csrf_token"
echo -n "Attempting to login "
# Retry for 2 mins
DJANGO_TOKEN="csrfmiddlewaretoken=$csrf_token"
i=0
session_id=
# Retry for 2 mins
while [ -z "$session_id" -a $i -lt 60 ]; do
    sleep 2
    $CURL_BIN -d \
        "$DJANGO_TOKEN&username=$OMERO_USER&password=$OMERO_PASS&server=$SERVER&url=$URL" \
    -X POST $LOGIN_URL > /dev/null || true
    session_id=$(grep sessionid cookies.txt | awk '{print $7}')
    echo -n "."
    let ++i
done
echo

if [ -z "$session_id" ]; then
    echo "Failed to login"
    exit 2
fi

echo "Session id: $session_id"
rm -f $COOKIES
