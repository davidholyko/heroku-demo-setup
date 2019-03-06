#!/bin/bash

curl "http://localhost:4741/appointments" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "appointment": {
      "doctor_id": "'"${DOCTOR}"'",
      "patient_id": "'"${PATIENT}"'",
      "date": "'"${DATE}"'"
    }
  }'

echo
