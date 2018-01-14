---
title: Knowledge Base Overview
layout: default_notime
---

{% assign mypages = site.pages | sort: 'top-category' | group_by: 'top-category' %}
{% for cat in mypages %}
<!-- Remove 1st element which is always blank -->
{% if forloop.first != true %}
<h2>{{ cat.name }}</h2>
<ul>
    {% assign items = cat.items %}
    {% for item in items %}
    {% if item.kb == true %}
    <li><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endif %}
    {% endfor %}
</ul>
{% endif %}
{% endfor %}
