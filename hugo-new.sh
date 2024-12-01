#!/bin/bash

# Check if a post name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 my-blog-post"
  exit 1
fi

# Define variables
POST_NAME=$1
DATE=$(date +"%Y%m%d")
POST_FOLDER="content/en/blog/${DATE}_${POST_NAME// /_}"
POST_FILE="${POST_FOLDER}/index.md"
HEADLINE_IMAGE="content/en/blog/hugo-theme-walden/headline.jpg"
THUMBNAIL_IMAGE="content/en/blog/hugo-theme-walden/thumbnail.jpg"

# Create the folder and file
mkdir -p "$POST_FOLDER"

# Generate ISO 8601-compliant date with colon in the timezone
DATE_ISO=$(date +"%Y-%m-%dT%H:%M:%S%z" | sed 's/\([+-][0-9]\{2\}\)\([0-9]\{2\}\)$/\1:\2/')

# Create the index.md file with Hugo archetype content
cat <<EOF > "$POST_FILE"
+++
title = '${POST_NAME//_/ }'
date = ${DATE_ISO}
draft = false
categories = 'Undefined'
tags = ['Undefined']
series = 'Undefined'
[params]
  author = 'Undefined'
+++

<!--more-->
EOF

# Copy the images
cp "$HEADLINE_IMAGE" "$POST_FOLDER/headline.jpg"
cp "$THUMBNAIL_IMAGE" "$POST_FOLDER/thumbnail.jpg"

# Confirm success
echo "New blog post created: $POST_FOLDER"
