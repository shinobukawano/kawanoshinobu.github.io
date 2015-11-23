---
layout: post
title: "Book Review: Sencha Touch in Action"
categories: 
css:
---

The last week, the book arrived to my home (at Tokyo, Japan) from overseas -- "<a href="http://www.manning.com/garcia2/">Sencha Touch in Action</a>".



<img src="/public/images/sencha-touch-in-action.jpg" alt="" title="sencha-touch-in-action" width="380" class="aligncenter size-full wp-image-1038" />



"Sencha Touch in Action" is the book which helped me when I was beginner of Sencha Touch two years ago. In those days, this book was working in progress, and I was reading this on MEAP (Manning Early Access Program).



In the last month, this book -- "Sencha Touch in Action" has finally completed. I read this again and I was so impressed, that's why I decided to write a book review.



I also wrote the review in Japanese. If you prefer to read in Japanese, please see at <a href="http://dev.ariel-networks.com/wp/archives/4007">http://dev.ariel-networks.com/wp/archives/4007</a>



<!--more-->

<h1>What I liked</h1>

<a href="https://twitter.com/ModusJesus">Jay Garcia</a>, main author of this book, is famous developer in Sencha community. He is CTO of Modus Create which focused on delivering high-end solutions with Sencha products. He has been answered many question at Sencha Forum, published article and instructional screencast for people to understand to Sencha frameworks. He is also author of "<a href="http://www.manning.com/garcia3/">Ext JS in Action</a>".



The attractive of this book is that condensed his long time experience of Sencha frameworks. This book has many column to understand the topic, it's so helpful, I think this is thanks to his longtime carrier.



Of course not only a column, main theme of this book -- explanation of framework is really easy to understand. For instance, explanation of Component Model, he described deeply with internal logic. The knowledge of Component lifecycle which I learned from this book helped me many times when I was in trouble. And then, I think most difficult concept of Sencha Touch is data package, He also detailed this concept. In Chapter 8 which describe data package, it also deal with infinite scroll that introduced in Touch 2.1, that's wonderful to support to latest frameworks updates.



My most favorite topic is Chapter 10. This chapter introduced Sencha Class System and then I learned how to create a custom component and plugin with step by step instruction. I created action list which able to show and hide with swipe gestures which is like a twitter timeline able to. I was impressed to the implementation of collaborate with drag event and CSS3 transform3d. Jay Garcia talked the topic how to create Sencha Touch custom component at Sencha Con 2013, maybe this theme is his specialty field. Slide of Sencha Con is here => 「Sencha Touch Custom Components」<a href="http://www.slideshare.net/moduscreate/creating-custom-component">http://www.slideshare.net/moduscreate/creating-custom-component</a>



BTW, this book has many of sample code. When I read first time, I felt annoy to this original coding style. This is to format equal and colon's line, like this.



<pre><code>var me         = this,
    someArray  = [];

someArray.push({
    name       : 'Kawano',
    age        : 12 ,
    someObject : {}
});
</code></pre>

The only reason of annoy to it is difference to my style. But one day I tried this style then I recognized that this style beautify a code. Finally I became favorite it, now my personal project uses this style.



<h1>What I didn't like</h1>

Sencha Touch is huge framework so this book is not covered all topic of framework. For example, this book is not deal with theming, native packaging, development with Sencha Architect. So you need to read API documentation of Sencha to learn those topics.



And bit a unfortunate point is that introduction of Sencha Cmd is at the end of book. I think it's friendly for beginner that to introduce Sencha Cmd in start point. Sencha Cmd was released recently, it's not wonder to introduce it at end of books. But I think this is adverse effect of writing project was long term.



<h1>Final Thoughts</h1>

There are one sentence of I was so impressed. In advice to create custom component which said



<blockquote>
  So, the lesson is, don't ever be afraid to look at the source code. Even if you don't get it at first glance, you'll learn something along the way and will be able to create some pretty awesome UI goodness.


</blockquote>

he emphasized the importance of read the source code of frameworks. I was sympathized deeply because I also believe the key to master this framework is to read the source code. And this book is most detailed guide to explain frameworks implementation than some books which was ever published. I think this book is a nice guide for beginner of Sencha Touch framework, but also a reliable help to read the frameworks source code. Oh, if you want to learn the framework in Japanese, I highly recommend <a href="http://www.amazon.co.jp/dp/4048869566">this book</a> -- "Sencha Touch Perfect Guide." (which I wrote :p)



