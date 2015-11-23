---
layout: post
title: "Ext.ux.AccordionList 1.0"
categories: 
css:
---

<img src="/public/images/i-accordion-list.png" alt="" title="i-accordion-list" width="100%" class="aligncenter size-full wp-image-873" />


The other day, I released <a href="https://market.sencha.com/extensions/ext-ux-accordionlist">Ext.ux.AccordionList</a>. Ext.ux.AccordionList is Sencha Touch's custom component which I created. It's able to collapse or expand items by tapped, thanks to Ext.data.TreeStore.



Also I created the API documentation, Jasmine and Phamtomjs based unit test.



<h3>Documentation page is here:</h3>

<a href="http://docs.kawanoshinobu.com/touch/#!/api/Ext.ux.AccordionList">http://docs.kawanoshinobu.com/touch/#!/api/Ext.ux.AccordionList</a>



Do you notice that it's using live preview with phone ui? This feature seems <a href="https://github.com/senchalabs/jsduck/issues/269">specific hack for Sencha Touch.</a> If you want to use it, configure <em>--touch-examples-ui</em> option when you build the document.



<!--more-->

Thanks for Phamtomjs, unit test could run on terminal.



<a href="/public/images/accordiontest.png"><img src="/public/images/accordiontest.png" alt="" title="accordiontest" height="380" class="alignnone size-full wp-image-861" /></a>



It's named Version 1.0 because I've finished tasks I wanted to. Other changes is following.



<ul>
<li>Update for Sencha Touch 2.2</li>
<li>Refactoring code</li>
<li>Add some utility config (headerItemCls, contentItemCls, useSelectedHighlights)</li>
<li>Add new example</li>
</ul>

Interested? I'm happy if you try the live demo and use it ;)



<h3>Live Demo:</h3>

<a href="http://docs.kawanoshinobu.com/accordionlist">http://docs.kawanoshinobu.com/accordionlist</a>



<h3>Repository:</h3>

<a href="https://github.com/kawanoshinobu/Ext.ux.AccordionList">https://github.com/kawanoshinobu/Ext.ux.AccordionList</a>



<h3>Sencha Market:</h3>

<a href="https://market.sencha.com/extensions/ext-ux-accordionlist">https://market.sencha.com/extensions/ext-ux-accordionlist</a>



