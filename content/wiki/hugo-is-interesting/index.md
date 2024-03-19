+++
title = "Hugo Is Interesting (Outdated; Using Zola Now)"
date = 2021-08-14
+++

So, I wanted a way to create a wiki/blog so that I could document all of the stuff that I do inside of my homelab, just in case I break something and need to fix it. 

# Why I Didn't Choose WordPress

I looked at WordPress first and while it could have done what I wanted, I decided I wanted something that I didn't host so if my server goes down I can still access it. Plus, I didn't want to have to worry about constantly updating WordPress to avoid possible security vulnerabilities. Now, you might say that I could have hosted WordPress on a VPS or something, but ya see, that requires money (And my budget is *very* tight).

# Github Pages

When looking on [Hugo's website](https://gohugo.io/), I saw that they had an option to host on GitHub. However, it looked a little complicated and I had no clue where to put the file it wanted me to create, so to YouTube I went. Found a [video by The Simple Engineer](https://www.youtube.com/watch?v=LIFvgrRxdt4) that did exactly what I wanted. I simply followed the steps in the video and BAM, I now got a website hosted in GitHub that I can easily access no matter what. All I have to do is do a `git commit -am "message" && git push` and then everything is published. 

# PaperMod

Once I had hugo setup, I had to find a good theme. Took a while, but I finally found [PaperMod](https://adityatelange.github.io/hugo-PaperMod/). All I did was go to the demo which had an installation page, `git clone` it, and then copy the sample `config.yml`. Now of course I changed it up some to better fit my needs, but that's pretty much it.
