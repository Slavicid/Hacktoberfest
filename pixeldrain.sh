#!/bin/bash

if ! command -v curl &>/dev/null; then
    echo "curl is not installed. Trying to install it..."
    if [[ $(uname) == "Linux" ]]; then
        if command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y curl
        else
            echo "Could not install 'curl'. Please install it manually."
            exit 1
        fi
    else
        echo "curl is not installed, and the system is not Linux. Please install it manually."
        exit 1
    fi
fi

if ! command -v jq &>/dev/null; then
    echo "jq is not installed. Trying to install it..."
    if [[ $(uname) == "Linux" ]]; then
        if command -v apt-get &>/dev/null; then
            sudo apt-get update
            sudo apt-get install -y jq
        else
            echo "Could not install 'jq'. Please install it manually."
            exit 1
        fi
    else
        echo "jq is not installed, and the system is not Linux. Please install it manually."
        exit 1
    fi
fi

upload_and_get_direct_link() {
    file_path="$1"
    response=$(curl --progress-bar -T "$file_path" https://pixeldrain.com/api/file/ | jq -r .id)

    if [ -n "$response" ]; then
        file_id="$response"

        if [[ "$file_path" == "https://pixeldrain.com/l"* ]]; then
            info_link="https://pixeldrain.com/api/list/$file_id"
            dl_link="https://pixeldrain.com/api/list/$file_id/zip?download"
        else
            info_link="https://pixeldrain.com/api/file/$file_id/info"
            dl_link="https://pixeldrain.com/api/file/$file_id?download"
        fi

        response=$(curl -s "$info_link")

        if [[ $response == *"\"success\":true"* ]]; then
            echo "Uploaded file and obtained Direct Download Link: $dl_link"
        else
            echo "ERROR: Can't download due to an issue."
        fi
    else
        echo "ERROR: File upload failed."
    fi
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_file.zip>"
    exit 1
fi

upload_and_get_direct_link "$1"
