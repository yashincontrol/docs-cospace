#!/bin/bash

processes=4

while getopts "p:" opt; do
  case $opt in
    p) processes=$OPTARG ;;
    \?) echo "Invalid option: -$OPTARG" >&2 ;;
  esac
done

mkdir -p repos

# Parse the YAML file and extract the repository URLs
urls=$(cat repo-manifest.yaml | grep 'url:' | awk '{print $2}')

cd repos

echo "$urls" | xargs -n 1 -P $processes git clone
