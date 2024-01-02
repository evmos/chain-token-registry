for file in $(find ./chainConfig -name '*.json'); do
    if ! ajv validate -s ./schema.chain.json -d "$file" --spec=draft2020 --errors=text; then
        exit 1
    fi
done

