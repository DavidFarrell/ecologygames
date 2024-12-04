# Ecology Games Website

## Local Development

Run the local development server with:

```bash
hugo server -D --disableFastRender --poll 500ms
```

This command:
- `-D`: Shows draft content
- `--disableFastRender`: Ensures full page rebuilds
- `--poll 500ms`: Watches for file changes every 500ms

## Creating Content

### New Posts

Create new posts using:

```bash
./hugo-new.sh [-g|-h] "Your Post Title"
```

Options:
- No flag: Creates a news post (default)
- `-g`: Creates a game post
- `-h`: Creates a headline post

If you can't execute it, do:

```bash
chmod +x hugo-new.sh
```

### Content Types

Control where content appears using the `series` parameter in the front matter:

```yaml
---
title: "Your Title"
date: 2024-03-14
draft: false
series: "news"     # options: "news", "games", or "headline"
categories: "News" # matches series: "News", "Games", or "Headlines"
tags: ["news"]     # matches series: ["news"], ["games"], or ["headline"]
---
```

Content Types:
- `series: "headline"`: Only one 'headline' is visible - it's the 'hero' post on the home page
- `series: "news"`: News items
  - Next 3 most recent appear as smaller cards below the headline
- `series: "games"`: Appears in games section - we show most recent 6

The script automatically sets appropriate categories and tags based on the content type. These are used for site organization and navigation:
- Categories appear in the site navigation
- Tags are used for related content and search functionality

## Deployment Note

After pushing to the repository:
1. Go to repo Settings → Pages
2. Enter `ecologygames.eu` in the Custom domain field
3. Save changes

This fixes the erroneous automatic deployment to gameologist.com/ecologygames.
