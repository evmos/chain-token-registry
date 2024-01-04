echo "Validating tokens against schema"
for file in $(find ./tokens -name '*.json'); do
    # Validate the file against the schema
    if ! ajv validate -s ./schema.token.json -d "$file" --spec=draft2020 --errors=text; then
        exit 1
    fi

    filename=$(basename "$file" .json)
    coinDenom=$(jq -r '.coinDenom' "$file")

    # Compare the filename to the coinDenom value
    if [ "$filename" != "$coinDenom" ]; then
        echo "Mismatch found: File '$filename.json' name does not match coinDenom '$coinDenom', rename it to '$coinDenom.json'"
        exit 1
    fi
done


# # Validate that there are no duplicate coinDenoms
echo "Validating that there are no duplicate coinDenoms"
jq '.coinDenom' ./tokens/*.json | sort | uniq -c | while read count value
do
  if [ "$count" -gt 1 ]; then
    echo "Duplicate found: $value"
    exit 1
  fi
done


echo "Validating ibc source is also registered and matches identifier"

identifiers=$(jq -r '.configurations[].identifier' ./chainConfig/*.json)

for file in $(find ./tokens -name '*.json'); do
  ibcSource=$(jq -r '.ibc.source' "$file")
  coinDenom=$(jq -r '.coinDenom' "$file")

  if echo "$identifiers" | grep -q "^$ibcSource$"; then
    echo "- $coinDenom ibc source is valid"
  else
    echo "No match chain found '$coinDenom' for ibc.source '$ibcSource' must match a chain identifier."
    exit 1
  fi
done