#!/bin/bash

curl "http://localhost:4741/authors" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
