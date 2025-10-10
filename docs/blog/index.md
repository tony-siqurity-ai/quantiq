---
layout: default
title: Cirquit Blog
---

# Cirquit Blog

Learn about quantum computing, product updates, and community stories.

<div class="posts">
  {% for post in site.posts %}
    <article class="post">
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
      <p>{{ post.excerpt }}</p>
      <a href="{{ post.url }}" class="read-more">Read More →</a>
    </article>
  {% endfor %}
</div>
