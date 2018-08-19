---
start: 2017-09-21 19:30
end: 2017-09-21 21:00
name: performances.names.jaa_impeerium
title: performances.titles.jaa_impeerium
country: est
language: est
image: performers/square/kitten.jpg
venue: cinema
sold_out: false
ticket_url: performances.ticket_links.jaa_impeerium
date: 2017-09-21
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <img src="{% asset performers/square/kitten.jpg @path %}" alt="Jaa !improteater ja Improteater Impeerium">
</picture>

{% tf performances/jaa_impeerium.md %}
