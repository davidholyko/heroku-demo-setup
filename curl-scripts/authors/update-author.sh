#!/bin/bash

curl "http://localhost:4741/authors/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "authors": {
      "first_name": "'"${FIRST_NAME}"'",
      "last_name": "'"${LAST_NAME}"'"
    }
  }'

echo
