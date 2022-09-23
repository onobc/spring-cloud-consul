#!/bin/bash

set -o errexit

mkdir -p target

SCRIPT_URL="https://raw.githubusercontent.com/spring-cloud-samples/brewery/2021.0.x/runAcceptanceTests.sh"
AT_WHAT_TO_TEST="CONSUL"

cd target

curl "${SCRIPT_URL}" --output runAcceptanceTests.sh

chmod +x runAcceptanceTests.sh

echo "Killing all running apps"
./runAcceptanceTests.sh -t "${AT_WHAT_TO_TEST}" -n

./runAcceptanceTests.sh --whattotest "${AT_WHAT_TO_TEST}" --killattheend
