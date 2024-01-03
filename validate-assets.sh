# validate that token images are present 

jq '.img.png, .img.svg' ./tokens/*.json |
while read -r FILE; do
    if [[ $FILE == null ]]; then
        continue
    fi
    # remove leading repo root
    FILE=${FILE#*\/main\/}

    # removes trailing "
    FILE=${FILE%\"}

    echo "Checking $FILE"
    # check if image exists
    if [[ ! -f "./$FILE" ]]; then
        echo "$FILE does not exist"
        exit 1
    fi
done


# validate that chain images are present
jq '.configurations[].img.png, .configurations[].img.svg' ./chainConfig/*.json |
while read -r FILE; do
    if [[ $FILE == null ]]; then
        continue
    fi
    # remove leading repo root
    FILE=${FILE#*\/main\/}

    # removes trailing "
    FILE=${FILE%\"}

    echo "Checking $FILE"
    # check if image exists
    if [[ ! -f "./$FILE" ]]; then
        echo "$FILE does not exist"
        exit 1
    fi
done

