#!/bin/bash

curl "http://localhost:4741/authors" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "authors": {
      "first_name": "'"${FIRST_NAME}"'",
      "last_name": "'"${LAST_NAME}"'"
    }
  }'

echo
