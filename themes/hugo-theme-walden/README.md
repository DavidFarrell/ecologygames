# Hugo Theme Walden

A simple and elegant Hugo theme inspired by Henry David Thoreau's love of nature and simple living. Walden is designed to be a clean, minimalist theme perfect for personal websites and blogs.

## Features

- Clean, responsive design
- Featured posts on homepage
- Post thumbnails support
- Multilingual support
- Custom shortcodes
- Markdown-based content

## Quick Installation

```bash
mkdir mysite
cd mysite
git init
git branch -m main
mkdir themes
git submodule add git@github.com:Homecat805/hugo-theme-walden.git themes/hugo-theme-walden
cp -rf themes/hugo-theme-walden/exampleSite/* ./
```

## Creating Blog Posts

### Using the Script (Recommended)

The theme includes a helper script `hugo-new.sh` to create new blog posts with the correct structure:

```bash
# Make the script executable (first time only)
chmod +x hugo-new.sh

# Create a new blog post
./hugo-new.sh "My Blog Post Title"
```

This will:
1. Create a new directory with today's date and your title
2. Set up the required index.md file with default frontmatter
3. Create a directory for your images

### Manual Creation

If you prefer to create posts manually, follow this structure:

1. Create a new directory under `content/[language]/blog/` with format: `YYYYMMDD_Your-Title`
2. Inside that directory, create an `index.md` file with this frontmatter:

```markdown
---
title: "Your Post Title"
date: YYYY-MM-DD
draft: false
tags: ["tag1", "tag2"]
thumbnail: "thumbnail.jpg"
---

Your content here...
```

3. Add any images to the same directory as your index.md file

## Demo

- Live demo: https://walden.genway.com.cn
- Local demo:
    ```bash
    git clone https://github.com/homecat805/hugo-theme-walden.git hugo-theme-walden
    cd exampleSite
    hugo server --themesDir ../..
    ```

## License

Walden is licensed under the MIT License. See the [LICENSE](https://github.com/homecat805/hugo-theme-walden/blob/master/LICENSE) file for details.
