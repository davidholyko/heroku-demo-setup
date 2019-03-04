#!/bin/bash

curl "http://localhost:4741/patients" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "patient": {
      "first_name": "'"${FIRST}"'",
      "last_name": "'"${LAST}"'",
      "diagnosis": "'"${DIAGNOSIS}"'",
      "born_on": "'"${BORN}"'"
    }
  }'

echo
