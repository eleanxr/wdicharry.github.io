---
layout: post
title: "Visualizing River Flow"
date: 2015-05-16 14:48:32
categories: python science work
---

At work, I've started working on a fellowship with our North American rivers
program to help them build data analysis and database tools for evaluating
water transactions. The idea is to build a set of indicators that can be used
to quantify the value of a set of water rights transactions to multiple
stakeholders that rely on river flow, and hopefully develop a transaction that
provides benefits to everyone, including municipalities, agricultural users,
and, of course, the environment.

My first task on this project was to build a few data visualizations to help
people visualize flow differences over many years. One of the suggested
techniques was the use of raster plots to visualize the data. Raster plots are
great for displaying periodic data over a large number of periods. The idea is
to stack periods on top of one another and use a colormap to place values. This
way, it's easy to see periodic trends over time and how the periodic behavior
changes over time. In the case of river flows, they follow yearly precipitation
and runoff cycles, so they are a perfect example of a case in which the raster
plot technique can provide insight about long term trends and changes.

My project does not include the Rio Grande in its study areas, but I wanted to
apply this technique to the Rio Grande to see what it looks like. I decided to
take a look at the Rio Grande gage I always check at this time of year in
preparation for a yearly rafting trip I've been going on since I was 8 years
old. Here's a log plot of the Rio Grande river's flow from 1930-2014. The
horizontal axis is the day of the year, the vertical axis is the year, and each
day gets a pixel that is colored based on the flow rate of the river at the
gage measured in cubic feet per second (cfs):

![Rio Grande at Embudo]({{ site.url }}/assets/rio_grande_embudo_flow.png)

It's a log plot, so the difference between 100 cfs and 1000 cfs is displayed
the same as difference between 1000 cfs and 10000 cfs. This keeps a few large
and small flow events from hiding the variance in intermediate flows. You can
immediately see some interesting features in the picture:

* 20 year drought cycle: 1930s, 1950s, 1970s, and 1990s.
* The 1990s drought lasts longer and is worse than previous droughts.
* 2003 and 2013 were both worse than the dust bowl of 1934.
* The irrigation ditches get shut off every year on November 1.
* The early 80s had a number of huge water years (corresponding to El Nino)

I'm sure there are others that are there, but those were the obvious ones that
jumped out at me. I don't think I can imagine what 11,000 cfs would look like
on the Rio Grande, but that's what it hit during that El Nino event in the
early 80s. Of course, this is all qualitative based on looking at the picture,
but it serves as a guide for quantitative analyses to follow up with.

I wrote custom [Python](http://www.python.org) code to generate this plot,
which can be viewed at 
[this GitHub Gist](https://gist.github.com/wdicharry/b549bc3b278456121700).
The code I wrote also contains functionality to visualize derived quantities
and some additional analysis tools, as well as a way to fiddle with the color
mapping. I hope to write another post about that part. If you just want to look
at a raster hydrograph for a particular gage, though, the USGS provides them on
[their web site](http://waterwatch.usgs.gov/?id=wwchart_rastergraph).

Prior to the most recent rain storm, the Embudo gage was running at about 700
cfs. That makes the stretch of river we run every year runnable, but rocky.
After the rain, it went to 900 cfs. Last year (2014, the topmost row in the
above graph), was not a great year either, but a well timed rain storm brought
the flow to 1000 cfs for a few days, giving us the most water we'd seen in
years. The figure illustrates that situations like that are happening more and
more frequently and the flow conditions that I grew up with are a thing of the
past.

