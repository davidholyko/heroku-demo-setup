#!/bin/bash

curl "http://localhost:4741/recipes" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "directions": "'"${DIRECTIONS}"'"
    }
  }'

echo
