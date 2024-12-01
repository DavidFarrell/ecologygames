#!/bin/bash

# Initialize variables
POST_TYPE="news"  # Default type

# Parse command line options
while getopts "g" opt; do
  case $opt in
    g)
      POST_TYPE="games"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift the options out of the argument list
shift $((OPTIND-1))

# Check if a valid blog post name was provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [-g] blog-post-name"
  echo
  echo "Options:"
  echo "  -g    Create a game post (defaults to news post if not specified)"
  echo
  echo "Examples:"
  echo "  $0 my-news-post          # Creates a news post"
  echo "  $0 -g my-game-post       # Creates a game post"
  echo "  $0 \"My Awesome Post\"     # Creates a news post with spaces in title"
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
if ! hugo new "blog/${DATE}_${POST_NAME}/index.md" --contentDir "content/en" 2>/dev/null; then
  echo -e "\e[31mError: Blog post already exists at 'content/en/blog/${DATE}_${POST_NAME}'\e[0m"
  exit 1
fi

# Adjust the title and series in the generated index.md
POST_FILE="${POST_FOLDER}/index.md"
if [ -f "$POST_FILE" ]; then
  # Remove date from title
  sed -i "s/title = '${DATE}_/title = '/" "$POST_FILE"
  
  # If this is a game post, set the series and tags to "games"
  if [ "$POST_TYPE" = "games" ]; then
    # Update or add series = 'games'
    if grep -q "^series = " "$POST_FILE"; then
      sed -i "s/^series = .*/series = 'games'/" "$POST_FILE"
    else
      sed -i "/^title = /a series = 'games'" "$POST_FILE"
    fi
    
    # Update or add tags = ['games']
    if grep -q "^tags = " "$POST_FILE"; then
      sed -i "s/^tags = .*/tags = ['games']/" "$POST_FILE"
    else
      sed -i "/^title = /a tags = ['games']" "$POST_FILE"
    fi
  fi
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
