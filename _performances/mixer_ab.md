---
start: 2017-09-20 18:10
end: 2017-09-20 19:15
name: performances.names.mixer_ab
title: performances.titles.mixer_ab
country: 
language: eng
image: performers/square/kitten.jpg
venue: cinema
sold_out: false
ticket_url: performances.ticket_links.mixer_ab
date: 2017-09-20
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <img src="{% asset performers/square/kitten.jpg @path %}" alt="Mixer AB">
</picture>

{% tf performances/mixer_ab.md %}
