for file in $(find ./tokens -name '*.json'); do
    if ! ajv validate -s ./schema.token.json -d "$file" --spec=draft2020 --errors=text; then
        exit 1
    fi
done


# Validate that there are no duplicate coinDenoms
jq '.coinDenom' ./tokens/*.json | sort | uniq -c | while read count value
do
  if [ "$count" -gt 1 ]; then
    echo "Duplicate found: $value"
  fi
done