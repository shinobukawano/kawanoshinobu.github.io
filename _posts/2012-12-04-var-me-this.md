---
layout: post
title: "var me = this の話"
categories: 
css: jp-post
---

<img src="/public/images/i-var1.png" alt="" title="i-var" height="100" class="aligncenter size-full wp-image-305" />


<a href="http://www.adventar.org/calendars/23">Sencha Advent Calendar 2012</a> の4日目の記事です。



夏頃から、Sencha Touch の解説書を執筆しています。執筆にあたり、「仕様を理解するだけでは不十分だ、ソースコードをしっかり読んで、内部の動きを正しく把握しなければ」と思い立ち、Sencha Touch のコードリーディングを熱心にやっていた時期がありました。今日はそこで目にした、不思議なコードについてのお話です。



<!--more-->

Sencha Touch のコードをデバッグした経験のある方は、以下のようなコードに見覚えがあるかもしれません。



<pre><code>someFunction : function () {
    var me = this;
    ...
    me.doSomething();
},
</code></pre>

this を一旦、me という名前の変数に代入して、以後は this の代わりに me を使っています。



最初に見た時、これはコンテキスト（this）を解決するための手段だと思いました。ある関数で、実行時の this を参照するために、一旦変数に入れているのだな、と。



こんな用途です。



<pre><code>someFunction : function () {
    var me = this;

    function func() {
        me.doAnything()
      }

    func();
},

...
</code></pre>

クロージャですね。ところが実際には、その必要がない場合でも使われています。なんとも不思議です。



調べてみると、実はこれ、<strong>コンパイル時の最適化</strong>が目的でした。this を一旦変数に入れて、以後はそれを使うようにすると、コンパイラで圧縮されたファイルのサイズが小さくなる、とのことです。



少し試してみました。



<pre><code>var test = function(hoge, fuga) {
    var ham = this.doSomething(hoge),
        spam = this.doAnything(fuga),
        hamName = ham.name,
        spamName = spam.name;

    return Ext.widget('egg', {
        layout: 'hbox',
        items: [
            this.goToHome(ham, spam),
            {
                id: 'gogogo',
                layout: 'vbox',
                width: '100%',
                items: [
                    this.doHeader(hamName),
                    this.doBody(spam, ham.slice(0, 7)),
                    this.doBody(spam, ham.slice(7, 14)),
                    this.doBody(spam, ham.slice(14, 21)),
                    this.doBody(spam, ham.slice(21, 28)),
                    this.doBody(spam, ham.slice(28, 35)),
                    this.doBody(spam, ham.slice(35, 42))
                ]
            }
        ]
    });
};
</code></pre>

このコードを圧縮すると、、



<pre><code>var test=function(e,a){var f=this.doSomething(e),d=this.doAnything(a),c=f.name,b=d.name;return Ext.widget("egg",{layout:"hbox",items:[this.goToHome(f,d),{id:"gogogo",layout:"vbox",width:"100%",items:[this.doHeader(c),this.doBody(d,f.slice(0,7)),this.doBody(d,f.slice(7,14)),this.doBody(d,f.slice(14,21)),this.doBody(d,f.slice(21,28)),this.doBody(d,f.slice(28,35)),this.doBody(d,f.slice(35,42))]}]})};
</code></pre>

<strong>400</strong>文字ですが、this を一旦変数に入れて、以後はそれを使うようにすると、、



<pre><code>var test = function(hoge, fuga) {
    var me = this,
        ham = me.doSomething(hoge),
        spam = me.doAnything(fuga),
        hamName = ham.name,
        spamName = spam.name;

    return Ext.widget('egg', {
        layout: 'hbox',
        items: [
            me.goToHome(ham, spam),
            {
                id: 'gogogo',
                layout: 'vbox',
                width: '100%',
                items: [
                    me.doHeader(hamName),
                    me.doBody(spam, ham.slice(0, 7)),
                    me.doBody(spam, ham.slice(7, 14)),
                    me.doBody(spam, ham.slice(14, 21)),
                    me.doBody(spam, ham.slice(21, 28)),
                    me.doBody(spam, ham.slice(28, 35)),
                    me.doBody(spam, ham.slice(35, 42))
                ]
            }
        ]
    });
};
</code></pre>

えいっ。



<pre><code> var test=function(f,a){var e=this,g=e.doSomething(f),d=e.doAnything(a),c=g.name,b=d.name;return Ext.widget("egg",{layout:"hbox",items:[e.goToHome(g,d),{id:"gogogo",layout:"vbox",width:"100%",items:[e.doHeader(c),e.doBody(d,g.slice(0,7)),e.doBody(d,g.slice(7,14)),e.doBody(d,g.slice(14,21)),e.doBody(d,g.slice(21,28)),e.doBody(d,g.slice(28,35)),e.doBody(d,g.slice(35,42))]}]})};
</code></pre>

<strong>377</strong>文字！<strong>23</strong>文字少なくなりましたね！



これだけ見ると、あまりメリットは感じないですが、チリも積もれば山、ということなのでしょう。ネットワークの悪い状況で使われるモバイルアプリだと、この少しの違いが大きな違いになる、、、のかもしれません。



社内のエンジニアに話してみたところ、賛否両論でした。「コンパイラのために記述スタイルを変えるのは、やり過ぎでは？」「フレームワークで利用されているスタイルなので、取り入れてもよいのでは？」「this とか me とか混在するのは嫌。見にくい。」などなど。



私は、Sencha らしい個性な気がして、嫌いではないです。皆様は、どう思われますでしょうか？



さて、<a href="http://www.adventar.org/calendars/23">Sencha Advent Calendar</a> ですが、明日以降は、しばらく誰もいない、という状況になってしまいました。。この後、どうなるのでしょうか。突如、素敵な方が現れて、クリスマスまで走りきってくれるのでは、と淡い期待を寄せています。



と、ここまで書いて、翌朝起きてみたら、<a href="https://twitter.com/martini3oz">@martini3oz</a> さんから、「5日、書きます」とのメッセージが！ありがとうございます！という訳で、明日は、Sencha UG 勉強会第3回での発表も予定している @martini3oz さんです。よろしくお願いします (=ﾟωﾟ)ﾉ



