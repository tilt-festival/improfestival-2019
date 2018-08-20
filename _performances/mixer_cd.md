---
start: 2017-09-21 18:15
end: 2017-09-21 19:15
name: performances.names.mixer_cd
title: performances.titles.mixer_cd
country: 
language: eng
image: performers/square/kitten.jpg
venue: cinema
sold_out: false
ticket_url: performances.ticket_links.mixer_cd
date: 2017-09-21
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <img src="{% asset performers/square/kitten.jpg @path %}" alt="Mixer CD">
</picture>

{% tf performances/mixer_cd.md %}
