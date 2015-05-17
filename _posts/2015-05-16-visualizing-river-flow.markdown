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
great for displaying almost-periodic data over a large number of periods. The
idea is to stack commensurate periods on top of one another and use a colormap
to identify values over time. This way, it's easy to see periodic trends over
time and how the periodic behavior changes over time. In the case of river
flows, they follow yearly precipitation and runoff cycles, so they are a
good example of a case in which the raster plot technique can provide
insight about long term trends and changes.

My project does not include the Rio Grande in its study areas, but I wanted to
apply this technique to the Rio Grande to see what it looks like. I decided to
take a look at the Rio Grande gage I always check at this time of year in
preparation for a yearly rafting trip I've been going on since I was 8 years
old.

Let's start with a simple line plot of the flows in cubic feet per second (cfs):

![Rio Grande at Embudo Line Plot]({{ site.url }}/assets/rio_grande_embudo_line.png)

You can see the peaks caused by snow runoff every year, and it's evident that
recent runoff (except for 2006) has been quite a bit less than much of the 20th
century. You can also start to see some periodic multi-year wet/dry cycles
evidenced in the size of the runoff peaks. The 1940s and the 1980s saw huge
flow events, with peaks reaching 10,000-11,000 cfs. The 1930s, the 1950s, the
1970s, and the 1990s into the 2000s saw multiple years where the flow never
exceeded 1000 cfs.

Now, let's look at the same data as a raster plot. The horizontal axis is the
day of the year, the vertical axis is the year, and each day gets a pixel that
is colored based on the flow rate of the river at the gage measured in cubic
feet per second (cfs):

![Rio Grande at Embudo]({{ site.url }}/assets/rio_grande_embudo_flow.png)

It's a log plot, so the difference between 100 cfs and 1000 cfs is displayed
the same as difference between 1000 cfs and 10000 cfs. Since the maximum
recorded flow in this period is 11700 cfs and the median flow is 508 cfs, the
logarithmic scale keeps most of the color range from being allocated to flows
that are rarely attained and hiding variation in more frequent flow values. In
addition to the larger trends you could also see in the line plot, you can see
more about flows throughout the year:

* During dry years, the lowest flows occur during the spring runoff season.
* 2001 and 2013 were both worse than the dust bowl of 1934.
* The irrigation ditches get shut off every year on November 1.
* In addition to the large flow peaks that occur in good water years during the
  runoff season, there are smaller flow peaks corresponding to the monsoon
  season.
* The current drought, from about 2000 to the present, has lasted longer and
  had flows that are consistently lower throughout the year than any of the
  previous droughts.

If you stare at it long enough, I'm sure you can find more interesting
features. Another way to use the raster plot is to visualize the days in
which a particular event occurs:

![Flow exceeds 75th percentile]({{ site.url }}/assets/rio_grande_embudo_75th.png)

This plot shows the top 25% of all daily flow values. In drought years,
especially the most recent ones, there are very few of these high flow events
during the summer monsoon season, roughly from July through September. 

I wrote custom [Python](http://www.python.org) code that uses
[NumPy](http://numpy.org), [Pandas](http://pandas.pydata.org) and
[Matplotlib](http://matplotlib.org) to generate these visualizations,
which can be viewed at 
[this GitHub Gist](https://gist.github.com/wdicharry/b549bc3b278456121700).
 If you just want to look at a raster hydrograph for a particular gage, though,
the USGS provides them on
[their web site](http://waterwatch.usgs.gov/?id=wwchart_rastergraph).

Prior to the most recent rain storm, the Embudo gage was running at about 700
cfs. That makes the stretch of river we run every year runnable, but rocky.
After the rain, it went to 900 cfs. Last year (2014, the topmost row in the
above graph), was not a great year either, but a well timed rain storm brought
the flow to 1000 cfs for a few days, giving us the most water we'd seen in
years. The data indicates that situations like that are happening more and
more frequently and the flow conditions that I grew up with are a thing of the
past.

