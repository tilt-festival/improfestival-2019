---
start: 2017-09-20 21:15
end: 2017-09-20 22:45
name: performances.names.divas_poulpe
title: performances.titles.divas_poulpe
country: lva/fra
language: eng
image: performers/square/kitten.jpg
venue: cinema
sold_out: false
ticket_url: performances.ticket_links.divas_poulpe
date: 2017-09-20
---

<picture>
    <source media="(min-width: 1200px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <source media="(min-width: 768px)" srcset="{% asset performers/wide/kitten.jpg @path %}">
    <img src="{% asset performers/square/kitten.jpg @path %}" alt="Divas/Poulpe">
</picture>

{% tf performances/divas_poulpe.md %}
