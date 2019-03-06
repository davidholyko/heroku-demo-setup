#!/bin/bash

curl "http://localhost:4741/doctors" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "doctor": {
      "first_name": "'"${FIRST_NAME}"'",
      "last_name": "'"${LAST_NAME}"'",
      "speciality": "'"${SPECIALITY}"'",
      "zip_code": "'"${ZIP_CODE}"'"
    }
  }'

echo
