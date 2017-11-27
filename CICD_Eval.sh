#!/bin/bash

REGEX="\"failed\":\[\{"
RESPONSE=`curl --insecure -X GET http://threadfix.nttsecuritylab.co.uk:8080/rest/policy/status/application/5/evaluate?apiKey={APIKEY}&fromDate=2017-11-23&toDate=2017-11-31`
#echo "${BASH_REMATCH[0]}"

if [[ $RESPONSE =~ $REGEX ]]; then
    FAILURE=${BASH_REMATCH[0]}
else
    echo "CICD PASS"
    exit 0
fi

echo "CICD Failure" $FAILURE
exit 1
