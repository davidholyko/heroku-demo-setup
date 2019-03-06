#!/bin/bash

curl "http://localhost:4741/meals" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "meal": {
      "recipe_id": "'"${RECIPE}"'",
      "ingredient_id": "'"${INGREDIENT}"'",
      "unit": "'"${UNIT}"'",
      "amount": "'"${AMOUNT}"'",
      "date": "'"${DATE}"'"
    }
  }'

echo
