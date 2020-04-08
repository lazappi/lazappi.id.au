---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Joining the Dots Twitter analysis"
subtitle: ""
summary: "Analysis of Twitter activity at the Joining the Dots visualisation
symposium."
authors: ["**Luke Zappia**"]
tags: ["conference", "visualisation", "Twitter"]
categories: ["migrated", "migrated2020"]
date: 2017-08-18
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

Today I attended the [Joining the Dots](https://joiningthedots.github.io/)
visualisation symposium. You can see the slides for my talk about clustering
trees [here](https://speakerdeck.com/lazappi/building-a-clustering-tree). It
was a great event and hope we see more meetings like this in the future. Here
is an analysis of the Twitter activity on the
[#jtdwehi](https://twitter.com/search?q=%23jtdwehi&src=typd) hashtag, thanks to
code from [Neil Saunders](https://nsaunders.wordpress.com). You can see it on
[Github](https://github.com/lazappi/jtdwehi-twitter).

# Introduction
An analysis of tweets from the Joining the Dots symposium. 1237 tweets were
collected using the `rtweet` R package:


```r
jtdwehi <- search_tweets("#jtdwehi", 10000)
saveRDS(jtdwehi, "data/jtdwehi.Rds")
```

## Search all the hashtags!

<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/hashtags-1.png) -->
{{< figure src="hashtags-1.png" >}}

# Timeline
## Tweets by day
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/tweets-by-day-1.png) -->
{{< figure src="tweets-by-day-1.png" >}}

## Tweets by day and time
Filtered for dates July 21-26, Prague time.
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/tweets-by-day-hour-1.png) -->
{{< figure src="tweets-by-day-hour-1.png" >}}

# Users
## Top tweeters

<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/tweets-top-users-1.png) -->
{{< figure src="tweets-top-users-1.png" >}}

## Sources
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/tweets-top-sources-1.png) -->
{{< figure src="tweets-top-sources-1.png" >}}

# Networks

## Replies

The "replies network", composed from users who reply directly to one another,
coloured by page rank.

Better to view the original PNG file in the `data` directory.

<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/jtdwehi_replies.png) -->
{{< figure src="jtdwehi_replies.png" >}}

## Mentions
The "mentions network", where users mention other users in their tweets.
Filtered for k-core >= 4 and coloured by modularity class.

Better to view the original PNG file in the `data` directory.

<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/jtdwehi_mentions-1.png) -->
{{< figure src="jtdwehi_mentions-1.png" >}}

# Retweets
## Retweet proportion
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/is-retweet-1.png) -->
{{< figure src="is-retweet-1.png" >}}

## Retweet count
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/retweet-count-1.png) -->
{{< figure src="retweet-count-1.png" >}}

## Top retweets
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> screen_name </th>
   <th style="text-align:left;"> text </th>
   <th style="text-align:right;"> retweet_count </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> _lazappi_ </td>
   <td style="text-align:left;"> Slides from my #jtdwehi talk today about building a clustering tree https://t.co/lwTztVstOC </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> _lazappi_ </td>
   <td style="text-align:left;"> .@bestqualitycrab Visualising creative research (more creatively) #jtdwehi #sketchnotes https://t.co/DXhk1u22nf </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> .@claresloggett's tips on where to start with data viz in Python #jtdwehi https://t.co/jN626uOAqd </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Visualising grant recipients: Davids most funded but Richards get more money #jtdwehi https://t.co/iPImbK4paf </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> mikejonesmelb </td>
   <td style="text-align:left;"> Really valuable point from @KathyReid: sometimes #dataviz decisions affected by need to consider political priorities and buy-in #jtdwehi </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gravitron </td>
   <td style="text-align:left;"> @bestqualitycrab demoing dataviz: ask the tricky Q's not the obvious. Consider the felt not just the instrumental.… https://t.co/ca1zCn4oSO </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> mikejonesmelb </td>
   <td style="text-align:left;"> More on the Transport Network Strategic Investment Tool (TraNSIT) here https://t.co/z5v827bfjd @Xavier_Ho #jtdwehi </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> mikejonesmelb </td>
   <td style="text-align:left;"> To visualise data is to encode it; how can we decode it? So Isabelle created Tracey McTraceface https://t.co/4YoxS4T6OS #jtdwehi </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> oldmateo </td>
   <td style="text-align:left;"> :: &quot;Research publishing methods stuck in the Stone Age&quot; ::  Brendan Ansell on balancing completeness and salience i… https://t.co/7WVV2Ni31U </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gravitron </td>
   <td style="text-align:left;"> @bestqualitycrab leading a chorus of Slipping Away. Just your run of the mill dataviz conference. #JoiningTheDots… https://t.co/6oxUMXZfpm </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
</tbody>
</table>

# Favourites
## Favourite proportion
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/has-favorite-1.png) -->
{{< figure src="has-favorite-1.png" >}}

## Favourite count
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/favorite-count-1.png) -->
{{< figure src="favorite-count-1.png" >}}

## Top favourites
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> screen_name </th>
   <th style="text-align:left;"> text </th>
   <th style="text-align:right;"> favorite_count </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> _lazappi_ </td>
   <td style="text-align:left;"> Slides from my #jtdwehi talk today about building a clustering tree https://t.co/lwTztVstOC </td>
   <td style="text-align:right;"> 19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Xavier_Ho </td>
   <td style="text-align:left;"> People are flowing back in #jtdwehi https://t.co/t4aU8WXoX9 </td>
   <td style="text-align:right;"> 16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WEHI_research </td>
   <td style="text-align:left;"> Welcome to delegates attending today's symposium Joining the Dots: The Art and Science of Data Visualisation! #jtdwehi #dataviz </td>
   <td style="text-align:right;"> 16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Visualising grant recipients: Davids most funded but Richards get more money #jtdwehi https://t.co/iPImbK4paf </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> _lazappi_ </td>
   <td style="text-align:left;"> .@bestqualitycrab Visualising creative research (more creatively) #jtdwehi #sketchnotes https://t.co/DXhk1u22nf </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> robbie_bonelli </td>
   <td style="text-align:left;"> So inspired by the talk given by @bestqualitycrab on the problem of #genderequality and how #dataviz can help us! Thanks Deb! #jtdwehi </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KathyReid </td>
   <td style="text-align:left;"> The incredible @bestqualitycrab keynoting #jtdwehi https://t.co/mLgKdVt4IX </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> .@claresloggett's tips on where to start with data viz in Python #jtdwehi https://t.co/jN626uOAqd </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> peterneish </td>
   <td style="text-align:left;"> Building a clustering tree https://t.co/KDgdRfBejZ #jtdwehi </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Representing Greek films via olive trees (which are are actually Markov chains) #jtdwehi https://t.co/SB2CG4oH8D </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
</tbody>
</table>

# Quotes
## Quote proportion
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/is-quote-1.png) -->
{{< figure src="is-quote-1.png" >}}

## Quote count
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/quotes-count-1.png) -->
{{< figure src="quotes-count-1.png" >}}

## Top quotes
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> screen_name </th>
   <th style="text-align:left;"> text </th>
   <th style="text-align:right;"> quote_count </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> peterneish </td>
   <td style="text-align:left;"> Would love to see some taxonomic data plotted like this. #jtdwehi https://t.co/EbBL872fum </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Xavier_Ho </td>
   <td style="text-align:left;"> overlaying clusters: the datavis movie #jtdwehi https://t.co/KA5ovvvW6r </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> frostickle </td>
   <td style="text-align:left;"> Where can people go from here, to take advantage of things they've learnt at #jtdwehi? @ResPlat? @OKFNau?

#dataviz https://t.co/TM6ngns9RS </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rowlandm </td>
   <td style="text-align:left;"> The money shot from @_lazappi_ ! #jtdwehi https://t.co/nqynLrC7Vg </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Xavier_Ho </td>
   <td style="text-align:left;"> Slide here: https://t.co/o2E59HHoZE #jtdwehi https://t.co/L98WV1tXgu </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> karinv </td>
   <td style="text-align:left;"> Thanks to @FCTweedie and @rubin_af for a great day of #dataviz! #jtdwehi https://t.co/Hti5FQtMGz </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rowlandm </td>
   <td style="text-align:left;"> LImited funding ... sounds like research! #jtdwehi https://t.co/gZwllFhtRe </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> peterneish </td>
   <td style="text-align:left;"> Fascinating insights into the life sciences #jtdwehi https://t.co/LpRwfP00ns </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> karinv </td>
   <td style="text-align:left;"> Adding the correct hashtag! (sorry folks) #jtdwehi https://t.co/PoGZe8k1k8 </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> robbie_bonelli </td>
   <td style="text-align:left;"> Depressing and motivating! #jtdwehi https://t.co/YCGB1ibYkw </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
</tbody>
</table>

# Media
## Media count
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/has-media-1.png) -->
{{< figure src="has-media-1.png" >}}

## Top media
<table>
 <thead>
  <tr>
   <th style="text-align:left;"> screen_name </th>
   <th style="text-align:left;"> text </th>
   <th style="text-align:right;"> favorite_count </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Xavier_Ho </td>
   <td style="text-align:left;"> People are flowing back in #jtdwehi https://t.co/t4aU8WXoX9 </td>
   <td style="text-align:right;"> 16 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Visualising grant recipients: Davids most funded but Richards get more money #jtdwehi https://t.co/iPImbK4paf </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> _lazappi_ </td>
   <td style="text-align:left;"> .@bestqualitycrab Visualising creative research (more creatively) #jtdwehi #sketchnotes https://t.co/DXhk1u22nf </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> KathyReid </td>
   <td style="text-align:left;"> The incredible @bestqualitycrab keynoting #jtdwehi https://t.co/mLgKdVt4IX </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> .@claresloggett's tips on where to start with data viz in Python #jtdwehi https://t.co/jN626uOAqd </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Representing Greek films via olive trees (which are are actually Markov chains) #jtdwehi https://t.co/SB2CG4oH8D </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> frostickle </td>
   <td style="text-align:left;"> Now @Xavier_Ho from the @CSIROnews is talking about Visualising the Australian Transport Network

#jtdwehi #dataviz https://t.co/DcvXYmD45F </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Getting underway for #jtdwehi with acknowledgement of country from @WEHI_research's director https://t.co/oNcnu5wtd9 </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FCTweedie </td>
   <td style="text-align:left;"> Patriarchy looks like this! What happens when we can describe the shape of injustice #jtdwehi https://t.co/8A7EhnFmt5 </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> gravitron </td>
   <td style="text-align:left;"> Best URL of the day goes to @Isa_Kiko's https://t.co/kapY0Aeacy  A great looking tool! #JoiningTheDots #jtdwehi https://t.co/gal2v1PUJY </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
</tbody>
</table>

### Most liked media image
<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/most_liked_media.jpg) -->
{{< figure src="most_liked_media.jpg" >}}

# Tweet text
The 100 words used 3 or more times.

<!-- ![](/post/2017-08-18-joining-the-dots-twitter-analysis_files/count-words-1.png) -->
{{< figure src="count-words-1.png" >}}
