---
layout: post
title: "Ext.ux.AccordionList 1.1 - New features, Sencha Architect, Siesta, and More!"
categories: 
css:
---

<img src="/public/images/accordionlist11.png" alt="accordionlist11" width="100%" class="alignnone size-full wp-image-1225" />

Howdy! I released new version of Ext.ux.AccordionList. It contains new features, integration into Sencha Architect, Siesta testing, and more! I introduce couple of them.

<!--more-->

<h1>New features</h1>

Thanks to my friends, new features that I added was requested by this component users. Maybe they looks not special but AccordionList couldn't do and I had a little bit effort to added these features.

<h3>Paging and Pull Refresh</h3>

With ListPaging plugin and PullRefresh plugin helps, AccordionList is able to do it. Please set `plugin` config of `listConfig` config to use it.

<img src="/public/images/11-loadmore.png" alt="11-loadmore" width="211" height="300" class="alignnone size-medium wp-image-1233" />

<h3>Bind Component</h3>

You can bind any component into items of AccordionList. If you want to do it, you should use Ext.ux.AccordionListItem and define `headerDataMap` config and `contentDataMap` config.

<img src="/public/images/11-componets.png" alt="11-componets" width="211" height="300" class="alignnone size-medium wp-image-1235" />

<h3>Grouping and Index Bar</h3>

Grouping items and indexed it. Use `indexBar` config. NOTICE: Sort of Tree store would takes strong costs.. Now I'm fixing this problem.

<img src="/public/images/11-grouped.png" alt="11-grouped" width="211" height="300" class="alignnone size-medium wp-image-1236" />

<h3>Indent</h3>

Indent by it's own depth. If `indent` config is true, AccordionList will indent items automatically.

<h1>Integrate into Sencha Architect</h1>

Sometimes I was asked from users, "Do you know how integrate your custom control into the Sencha Architect?", Now I can say "Of course, It's possible!". I added some config to integrate into Sencha Architect. (Thanks to new feature of Architect 3. I really appreciate it:)).

If you want to use AccordionList with Architect, please install `Ext.ux.AccordionList.aux` file of `architect` directory. Then you will find this component at Toolbox section. Please drag component to design area, that's all.

AccordionList creates list instance dynamically, so you cannot see the preview, but able to define some config by config section.

<img src="/public/images/11-architect.png" alt="architect" width="100%" class="alignnone size-large wp-image-1227" />

<h1>Testing with Siesta</h1>

I changed test tool, Jasmine to Siesta. Siesta is great tool, actually I fell in love to it. I haven't use full of feature of it yet, but Siesta is able to speak Sencha that is a great attractive point for me. I want to continue to use it.

To run the test, install this project into where the web server can serve your apps, and access to http://localhost/Ext.ux.AccordionList/tests from browser.

<img src="/public/images/11-siesta.png" alt="siesta" width="100%" class="alignnone size-full wp-image-1229" />

<h1>And More!</h1>

Also I upgraded support library, Touch 2.3.1 and Sencah Cmd 4.0.1 and fixed some of bugs. 

Now, you can download this component from Sencha Market or GitHub repository.

<strong>Ext.ux.AccordionList at Sencah Market:</strong>
<a href="https://market.sencha.com/extensions/ext-ux-accordionlist">https://market.sencha.com/extensions/ext-ux-accordionlist</a>

<strong>Ext.ux.AccordionList at GitHub repository:</strong>
<a href="https://github.com/shinobukawano/Ext.ux.AccordionList">https://github.com/shinobukawano/Ext.ux.AccordionList</a>

I hope this component will help you. Cheers :)

