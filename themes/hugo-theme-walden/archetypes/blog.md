+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
date = {{ .Date }}
draft = false
categories = 'News'
tags = ['news']
series = 'headline' # Optional, add this if you want it to appear in the headline section
[params]
  author = 'Paidia'
+++
Your "before the jump" text here.
headline.jpg is shown here when you are main story
thumbnail.jpg is shown here when you are not main story
<!--more-->
Your "after the jump" text here.
thumbnail.jpg is shown here 