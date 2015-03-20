---
layout: post
title: "Remote Sensing Project"
date: 2015-03-07 14:32:25
categories: development remote-sensing
---

Ok, so I'm failing pretty spectacularly at this blogging thing and decided that
any post, no matter how short would be a Good Thing.

One of my side projects is focused on remote sensing, specifically how it can
be applied to problems of conservation. I get a little bit of time at work on
this effort, but I'm also spending quite a bit of my own time on it. Thus far,
I have a tool for building composite images from Landsat 8 OLI/TIRS data. It's
pretty simple, but one of the cool things I did with it was building an
abstraction layer between the actual algorithms that manipulate and analyze
images and an underlying GIS. We use the ESRI stack pretty heavily at work, but
I also like to fiddle around with the tools on my own Linux box, so it's nice
to be able to use GDAL when I'm just working on small things on my own. The
project is published on
[GitHub](https://github.com/wdicharry/remote-sensing.git) for anyone who may be
interested.
