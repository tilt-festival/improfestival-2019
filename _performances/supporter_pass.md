---
start: 2017-09-23 23:00
end: 2017-09-23 23:00
name: performances.names.supporter_pass
title: performances.titles.supporter_pass
country: mixed
language: mixed
image: performers/square/festival_pass.jpg
venue: 
sold_out: false
ticket_url: performances.ticket_links.supporter_pass
date: 2017-09-23
show_in_schedule: false
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/festival_pass_large.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/festival_pass_large.jpg @path %}">
    <img src="{% asset performers/square/festival_pass.jpg @path %}" alt="Festival Pass">
</picture>

{% tf performances/supporter_pass.md %}
