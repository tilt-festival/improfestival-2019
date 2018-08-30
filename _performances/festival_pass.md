---
start: 2018-09-22 23:00
end: 2018-09-22 23:00
name: performances.names.festival_pass
title: performances.titles.festival_pass
country: mixed
language: mixed
image: performers/square/festival_pass.jpg
venue: 
sold_out: false
ticket_url: performances.ticket_links.festival_pass
date: 2018-09-22
show_in_schedule: false
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/festival_pass.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/festival_pass.jpg @path %}">
    <img src="{% asset performers/square/festival_pass.jpg @path %}" alt="Festival pass">
</picture>

{% tf performances/festival_pass.md %}
