#!/bin/bash

# Define the lines to add
lines="---\npublic:: true\n---"

# Loop through each .md file in the folder
for file in *.md; do
  # Add the lines to the beginning of the file
  echo -e "$lines\n$(cat "$file")" > temp && mv temp "$file"
done