---
layout: post
title: "Hello, Sencha Touch Flat UI Theme :)"
categories: 
css:
---

Do you like Flat Design? If so, this is maybe good news for Sencha Touch developers.



This weekend, I created Sencha Touch custom theme based on Flat UI. You can check it at demo site, I deployed kitchin sink app with this theme.



<strong>Kitchen Sink with Flat UI Theme:</strong>



<a href="http://kawanoshinobu.com/apps/sencha-touch-flat-ui/">http://kawanoshinobu.com/apps/sencha-touch-flat-ui/</a>



<strong>Repository is here:</strong>



<a href="https://github.com/kawanoshinobu/sencha-touch-flat-ui-theme">https://github.com/kawanoshinobu/sencha-touch-flat-ui-theme</a>



<!--more-->

<h1>Usage</h1>

Easy to use, copy and compile.



Copy <code>dist/src</code> directory's file to your project's <code>resource/touch</code> directory.



<pre><code>cp -r ../sencha-touch-flat-ui-theme/dist/src/ touch/resources/`
</code></pre>

Update your project's app.scss file as following.



<pre><code>// @import 'sencha-touch/default';  
// @import 'sencha-touch/default/all';  
@import 'sencha-touch/flat';  
@import 'sencha-touch/flat/all';

// Custom code goes here..
</code></pre>

Then, compile app.scss. That's it!



<pre><code>compass compile resources/sass/`
</code></pre>

<h1>Setup</h1>

In order to add a new swatch or colors you can add a new stylus file under <code>src/themes/stylesheets/sencha-touch/flat</code> and run <a href="http://gruntjs.com/">grunt</a> from your command line.



<ul>
<li>brew install node</li>
<li>npm install -g grunt-cli</li>
<li>cd to project's folder</li>
<li>npm install</li>
<li>grunt watch</li>
<li>start modifying src/themes/stylesheets/sencha-touch/flat files</li>
</ul>

<h1>Please try it!</h1>

Actually, it was started thanks to one email by foreign developer. it cheers me up :D



I'm happy if you try Sencha Touch Flat UI Theme, feedback is especially welcome!



<h1>Showcase</h1>

<img src="/public/images/sencha-touch-flat-ui.png" alt="" title="sencha-touch-flat-ui" width="100%" class="alignnone size-full wp-image-898" />



