---
layout: post
title: "Accordion List with useComponents!"
categories: 
css:
---

Good morning! Yesterday, I added new feature into <a href="https://github.com/kawanoshinobu/Ext.ux.AccordionList">Ext.ux.AccordionList</a>. From now on, you can add a components into header item and content item. Actually, This feature was requested by many users. Thanks to all users, their voice grows this component more useful.



<!--more-->

<h1>Usage</h1>

In first, you must create a class which extends "Ext.ux.AccordionListItem". Then, define dataMap for header item and content item. Way of define is same to dataMap of Ext.dataview.DataItem.



<pre><code>Ext.define('AccordionListExample.view.ListItem', {
    extend: 'Ext.ux.AccordionListItem',
    xtype : 'examplelistitem',

    config: {
        ...

        headerDataMap: {
            getText: {
                setHtml: 'text'
            },
            getButton: {
                setIconCls: 'icon'
            }
        },
        contentDataMap: {
            getLimit: {
                setValue: 'limit'
            },
            getMessage: {
                setValue: 'message'
            }
        }
</code></pre>

You created data item class. Next, you specify use this in your view config.



<pre><code>        {
            xtype: 'accordionlist',
            store: Ext.create('AccordionListExample.store.Components'),
            flex: 1,
            indent: true,

            // Specify useComponents.
            useComponents: true,
            // Specify data item's xtype you created.
            defaultType: 'examplelistitem',

            listeners: {
                initialize: function() {
                    this.load();
                }
            }
        }
</code></pre>

That's ok. Accordion List appears components bound items. You can check it at example site.



<a href="http://docs.kawanoshinobu.com/accordionlist">http://docs.kawanoshinobu.com/accordionlist</a>



See "components" tab's view.



<img src="/public/images/useC1.png" alt="" title="useC1" width="434" height="616" class="alignnone size-full wp-image-949" />



It able to nested.



<img src="/public/images/useC2.png" alt="" title="useC2" width="434" height="616" class="alignnone size-full wp-image-950" />



I added button component to header item. When tapped button, it fires tap event.



<img src="/public/images/useC3.png" alt="" title="useC3" width="434" height="616" class="alignnone size-full wp-image-953" />



I added date picker component and text area component to content item. It able to edit.



<img src="/public/images/useC4.png" alt="" title="useC4" width="434" height="616" class="alignnone size-full wp-image-954" />



Of course, these item generated from passed data.



<img src="/public/images/useC5.png" alt="" title="useC5" width="434" height="616" class="alignnone size-full wp-image-955" />



<h1>What's next?</h1>

Now, AccordionList has so many feature. That's why, I have no idea to add new one. I need your help. If you like this component, please request new feature. Maybe, I will add it joyfully :)



