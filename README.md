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
./hugo-new.sh "Your Post Title"
```

If you can't execute it, do 

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
series: "news"  # or "games"
---
```

- `series: "news"`: News items
  - Most recent post becomes the featured hero headline
  - Next 3 most recent appear as smaller cards below
- `series: "games"`: Appears in games section - we show most recent 6

## Deployment Note

After pushing to the repository:
1. Go to repo Settings → Pages
2. Enter `ecologygames.eu` in the Custom domain field
3. Save changes

This fixes the erroneous automatic deployment to gameologist.com/ecologygames.
