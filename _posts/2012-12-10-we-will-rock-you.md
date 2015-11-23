---
layout: post
title: "We Will Rock You!"
categories: 
css: jp-post
---

<img src="/public/images/tired.png" alt="" title="tired" height="380" class="aligncenter size-full wp-image-333" />


深夜27時のテンションでお送りする <a href="http://www.adventar.org/calendars/23">Sencha Advent Calendar</a> 10日目です。



Sencha Touch の開発は楽しいことばかりではありません。不可解な挙動を調べるために半日デバッグすることもありますし、バージョンアップで後方互換性のなさに苦しめられることもあります。今回は、Sencha Touch の開発に疲れたそんな時に、モチベーションを奮い立たせる方法をご紹介します。



<!--more-->

まずは Queen の「We Will Rock You」をかけましょう。YouTube の URL は以下です。



　　<a href="http://www.youtube.com/watch?gl=JP&amp;hl=ja&amp;v=-tJYN-eG1zk">http://www.youtube.com/watch?gl=JP&amp;hl=ja&amp;v=-tJYN-eG1zk</a>



<ol>
<li>開発している PC ブラウザのコンソールを開きます。 </li>
<li>おもむろに、Ext.device.Notification.vibrate() と入力します(*1)。</li>
<li>Enter キーを押下。「ターンッ」と、強めに押して下さい。 </li>
<li>画面が震えます。 </li>
<li>大事なことなので、もう一回書きます。<strong>画面が震えます。</strong> </li>
</ol>

<strong>Sencha Touch が身を震わせながら、「がんばって！」と応援してくれます！</strong>これで奮い立たないモチベーションなら、モチベーションとは一体なんなのか！



Vimeo にその勇姿をアップしました。



<iframe src="//player.vimeo.com/video/55203029" width="500" height="313" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

<a href="http://vimeo.com/55203029">Sencha Touch 2.1 Ext.device.Notification.vibrate</a> from <a href="http://vimeo.com/kawanoshinobu">kawanoshinobu</a> on <a href="https://vimeo.com">Vimeo</a>.



... これだけだと、あんまりなので、少し技術的な解説を。



Ext.device.Notification.vaibrate は、端末のバイブレーションを実行するメソッドです。ネイティブアプリにパッケージングした際に意味のある機能です。このメソッドを、PC ブラウザで実行した場合、先ほどの動画でご覧頂いたように画面が震えます。これは、バイブレーションを模擬する目的です。



具体的には、以下のコードが実行されます。



<pre><code>vibrate: function() {
    //nice animation to fake vibration
    var animation = [
        "@-webkit-keyframes vibrate{",
        "    from {",
        "        -webkit-transform: rotate(-2deg);",
        "    }",
        "    to{",
        "        -webkit-transform: rotate(2deg);",
        "    }",
        "}",

        "body {",
        "    -webkit-animation: vibrate 50ms linear 10 alternate;",
        "}"
    ];

    var head = document.getElementsByTagName("head")[0];
    var cssNode = document.createElement('style');
    cssNode.innerHTML = animation.join('\n');
    head.appendChild(cssNode);

    setTimeout(function() {
        head.removeChild(cssNode);
    }, 400);
}
</code></pre>

JavaScript で動的に CSS を適用して、端末の振動をエミュレートしています。



CSS では、まず vibrate という名前のキーフレームを定義しています。from 要素で指定するのは、アニメーションの始まりの状態です。-webkit-transform の rotate で -2度の傾きを指定します。アニメーションの終わりの状態を定義する to 要素で、+2度の傾きを指定します。



定義したキーフレームを、body タグに適用します。animation-duration（アニメーション完了までの時間）を 0.05秒、animation-timing-funciton（アニメーションの変化量）は linear（等速）、animation-direction（アニメーションが逆再生するか）は alternate（逆再生する）としています。



そして、この、左右に激しく揺さぶる目的の CSS を 0.4秒間だけ適用します。



まさに、nice animation to fake vibration！このコードから分かるのは、もっと長く揺さぶられたい場合は、head.removeChild(cssNode) を行うまでの時間を変えればよい、ということです。4000000 あたりが妥当でしょうか。



さて、ネタ切れ感漂う <a href="http://www.adventar.org/calendars/23">Sencha Advent Calendar</a> ですが、明日は <a href="https://twitter.com/kiris">@kiris</a> さんです。@kiris さんは、私が所属するチームの頼れるリーダーです。JavaScript はそんなに好きではない、といいながら、JavaScript 関連の本を多数執筆しています。明日は、どうぞよろしくお願いします (´▽｀)



*1 ... Ext.device.Notification クラスが require されている必要があります。動的ローディングが可能な環境では、



<pre><code>Ext.Loader.require('Ext.device.Notification'); 
</code></pre>

を実行すると、必要なファイルが読み込まれます。



