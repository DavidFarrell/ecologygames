#!/bin/bash

# Check if a valid blog post name was provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 blog-post-name"
  echo
  echo "This script creates a new blog post in the format 'YYYYMMDD_blog-post-name'."
  echo "Please provide the blog post name as a single argument, using hyphens instead of spaces, or wrap it in quotes (e.g., 'my-awesome-post' or 'my awesome post')."
  echo
  echo "What happens:"
  echo "1. A new folder 'content/en/blog/YYYYMMDD_blog-post-name/' is created."
  echo "2. The front matter for the post is generated using archetypes defined in:"
  echo "   'themes/hugo-theme-walden/archetypes/blog.md'."
  echo "3. Two images (headline.jpg and thumbnail.jpg) are copied to the folder."
  echo "4. Default content is added for the new post."
  exit 1
fi

# Define variables
POST_NAME=${1// /-}  # Replace spaces with hyphens
DATE=$(date +"%Y%m%d")
POST_FOLDER="content/en/blog/${DATE}_${POST_NAME}"
HEADLINE_IMAGE="content/en/blog/hugo-theme-walden/headline.jpg"
THUMBNAIL_IMAGE="content/en/blog/hugo-theme-walden/thumbnail.jpg"

# Create the blog post using the archetype
hugo new "blog/${DATE}_${POST_NAME}/index.md" --contentDir "content/en"

# Adjust the title in the generated index.md to remove the date
POST_FILE="${POST_FOLDER}/index.md"
if [ -f "$POST_FILE" ]; then
  sed -i "s/title = '${DATE}_/title = '/" "$POST_FILE"
else
  echo "Error: Failed to find the generated post file at '$POST_FILE'."
  exit 1
fi

# Copy the images
if [ -d "$POST_FOLDER" ]; then
  cp "$HEADLINE_IMAGE" "$POST_FOLDER/headline.jpg"
  cp "$THUMBNAIL_IMAGE" "$POST_FOLDER/thumbnail.jpg"
else
  echo "Error: Blog folder '$POST_FOLDER' was not created by Hugo."
  exit 1
fi

# Confirm success
echo "New blog post created: $POST_FOLDER"
