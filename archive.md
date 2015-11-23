---
layout: page
title: Archive
permalink: /archive/
---

<ul class="posts">
  {% assign posts_list = site.posts %}
  {% assign has_post = false %}

  {% for node in posts_list %}
    <li>
        <h3 class="post-title">
          <a href="{{ node.url }}">
            {{ node.title }}
          </a>
        </h3>
        <span class="post-date">{{ node.date | date_to_string }}</span>
    </li>
    {% assign has_post = true %}
  {% endfor %}
  {% if has_post == false %}
    Sorry, but there are not any posts in this category yet.
  {% endif %}
</ul>
