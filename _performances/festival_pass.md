---
start: 2019-09-19 18:00
end: 2019-09-22 22:45
date: 2019-09-22
name: performances.names.festival_pass
title: performances.titles.festival_pass
country: 
language: mixed
image: performers/square/festival_pass.jpg
venue: catherine
sold_out: false
ticket_url: performances.ticket_links.festival_pass
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/festival_pass.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/festival_pass.jpg @path %}">
    <img src="{% asset performers/square/festival_pass.jpg @path %}" alt="festival pass">
</picture>

{% tf performances/festival_pass.md %}
