---
layout: post
title: "Sencha Touch + WebRTC!"
categories:
css:
---

<img src="/public/images/Logo-webrtc.png" alt="" title="Logo-webrtc" width="300" height="210" />



The last week, study meeting to learn about WebRTC was held at my office. WebRTC is a project or APIs for browser-based real-time communication, currently it is standardized by the W3C. If you want to know detail, please check the project site.



<ul>
<li><strong>WebRTC：</strong>
<a href="http://www.webrtc.org">http://www.webrtc.org</a></li> </ul>
I tried some code that introduced by this study meeting, then I thought it's a good idea to implement Sencha Touch custom component for webRTC. That's why I made it.



<!--more-->

<h2>Usage</h2>

Simply, if you want to output camera stream to the web page,



<pre><code>{
    xtype: 'webrtc'
}
</code></pre>

That's all. You open the page, then it shows the message to permit to use the device camera, please go ahead.



<img src="/public/images/rtc1.png" style="height:512px !important;margin-top: 1em;" />



If it got the stream, display it to the web page.



<img src="/public/images/rtc2.png" style="height:512px !important;margin-top: 1em;" />



If it cannot got it, shows error message.



<img src="/public/images/rtc3.png" style="height:512px !important;margin-top: 1em;" />



if you want to effect stream,



<pre><code>{
    xtype    : 'webrtc',
    useEffect: true,
    effectFn : 'monochrome'
}
</code></pre>

<code>useEffect</code> option changes the way of display, stream will be outputted by canvas (Normally, it use with video tag). <code>effectFn</code> option define function object or effect name which offered by component. If you define <code>monochrome</code>, it outputs the stream with monochrome effect.


<br>
<img src="/public/images/rtc4.png" style="height:512px !important;margin-top: 1em;" />



<h2>Conclusion</h2>

Actually, the smart phone’s default browser is not support WebRTC.. Now, we can use WebRTC APIs on Chrome for Android (since 29), Firefox (since 24), Opera Mobile (since 21) only. My favorite browser Safari is not sure to support WebRTC. But, it is a great dream to communicate each web browser, I thought. I want to continue to maintain this component.



<ul>
<li>Demo
<a href="http://shinobukawano.github.io/Ext.ux.WebRTC/">http://shinobukawano.github.io/Ext.ux.WebRTC/</a>

</li>
<li>Repository
<a href="https://github.com/shinobukawano/Ext.ux.WebRTC">https://github.com/shinobukawano/Ext.ux.WebRTC</a></li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul> </li> </ul>

</li>
</ul></li>
</ul>

