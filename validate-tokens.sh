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


# Validate that there are no duplicate coinDenoms
jq '.coinDenom' ./tokens/*.json | sort | uniq -c | while read count value
do
  if [ "$count" -gt 1 ]; then
    echo "Duplicate found: $value"
    exit 1
  fi
done