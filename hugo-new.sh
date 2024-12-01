#!/bin/bash

# Check if a post name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 my-blog-post"
  exit 1
fi

# Define variables
POST_NAME=$1
DATE=$(date +"%Y%m%d")
# Use the same path Hugo generates, avoiding hardcoding 'en'
POST_FOLDER="content/en/blog/${DATE}_${POST_NAME// /_}"
HEADLINE_IMAGE="content/en/blog/hugo-theme-walden/headline.jpg"
THUMBNAIL_IMAGE="content/en/blog/hugo-theme-walden/thumbnail.jpg"

# Create the blog post using the archetype
hugo new "blog/${DATE}_${POST_NAME// /_}/index.md" --contentDir "content/en"

# Copy the images
# Use the actual folder created by Hugo
cp "$HEADLINE_IMAGE" "$POST_FOLDER/headline.jpg"
cp "$THUMBNAIL_IMAGE" "$POST_FOLDER/thumbnail.jpg"

# Confirm success
echo "New blog post created: $POST_FOLDER"
