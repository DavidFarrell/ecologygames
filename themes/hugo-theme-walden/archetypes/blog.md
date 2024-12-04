+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
date = {{ .Date }}
draft = false
categories = 'News'
tags = ['news']
series = 'news' # options are news or games or headline - headline replaces hero post on home page
[params]
  author = 'Paidia'
+++
Your "before the jump" text here.
headline.jpg (1656x350) is shown here when you are main story
thumbnail.jpg (900x300) is shown here when you are not main story
<!--more-->
Your "after the jump" text here.
thumbnail.jpg is shown here 