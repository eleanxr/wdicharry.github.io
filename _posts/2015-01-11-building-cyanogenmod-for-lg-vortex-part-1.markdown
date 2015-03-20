---
layout: post
title: "Building CyanogenMod for LG Vortex Part 1"
date: 2015-01-11 15:13:40
categories: android
---

I have an old LG Vortex phone laying around that I'd like to just use as a
simple music player without any of the phone or 3G Internet capabilities. It's
old enough that when I say 3G, I really mean 3G. Basically, I'd like to convert
it into something like an iPod touch. Of course, I could just put it in
airplane mode all of the time, but I'd also like to get rid of all of the
bloatware that was on the phone, and since I'm rooting it anyway I might as
well have some fun by putting a different version of Android on it. 

I've never done this to a phone before, although I've done plenty of system
level software development in C and C++, so it seems like something that's
well within my abilities. There's actually no supported build of CyanogenMod
for the LG Vortex, so I'm starting with something similar to see if I can
get it to work. It seems that the LG Optimus One was a version of the Vortex
that was released on the international market, so I'm starting with that as
my template. I figure I'll try and get it working with that template, as
they have a supported version of CyanogenMod (based on Gingerbread) for
that model.

I started with the instructions [here](http://wiki.cyanogenmod.org/w/Build_for_p500)
on my Ubuntu 14.10 system. Of course nothing's easy.

The first problem I ran into was actually just cloning the gingerbread branch
of the CyanogenMod repository. The clone failed on one of the Git repositories
with a message about a DMCA takedown. That seems pretty odd for a well established
open source project, so I looked into it. Turns out that CyanogenMod version of
the `external/svox` repository was indeed taken off of GitHub by a DMCA request.
This is odd, because the repository is also in the AOSP repositories, happily
existing with no takedown. The CyanogenMod project doesn't make any changes to
that repository, so the fix for this was to open `.repo/manifests/default.xml`
and change

    <project path="external/svox" name="CyanogenMod/android_external_svox" />

to

    <project path="external/svox" name="platform/external/svox" remote="aosp" revision="gingerbread" />

which makes it pull the AOSP version of that repository from Google.

That got the clone to succeed, so I did the rest of the setup to get to the
building step. I was missing a few of the proprietary shared objects when
I executed the `extract-files.sh` script, so that may come back to bite me
down the line somewhere.

Next, the build failed early on with a message like this:

    build/core/prebuilt.mk:141: *** recipe commences before first target.  Stop.

After staring at that file for a while, I consulted the oracle and found a bug report
in [FirefoxOS](https://bugzilla.mozilla.org/show_bug.cgi?id=1031593) of all places indicating that Android can't be built with make 4.0, which
is the version that Ubuntu 14.10 ships with. A few people suggested downgrading the system
version of make, but I'm always wary of fiddling with system packages. Instead, I downloaded
the source for Make 3.81 from GNU and built and installed it locally in `/opt` and updated
the Android `build/envsetup.sh` script to put it in the path before the system version.

That got me a little further along until the build failed with this message:

    Unknown parameter a interfaceName for tags/attrs

Followed by a slew of WebKit build errors. Other than the fact that it was in WebKit,
there was no other information about what actually failed. This was also a known issue
with GCC 4.6 and above (Ubuntu 14.10 ships with 4.9.1). The fix was to open
`external/webkit/WebCore/dom/make_names.pl` and remove the `-P` flag from the
preprocessor. This keeps it from inserting line markers in the preprocessor's output
specifying the original location of the source.

That got the build further until it failed on one of the aforementioned proprietary
shared objects, `vendor/lge/p500/proprietary/lib/libril-qc-qmi-1.so`. So now I need
to track down what that is and whether I need it, and if so, where I can get it.
To be continued...
