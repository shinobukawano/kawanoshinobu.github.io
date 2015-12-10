---
layout: post
title: "ユーザーエクステンションを作る時に気をつけるべき7つのこと (Part1)"
categories: 
css: jp-post
---

<pre>
この記事は <a href="http://www.adventar.org/calendars/137" target="_blank">Sencha Advent Calendar 2013</a> の13日目の記事です。
</pre>

12月から新社会人の川野です。「13日の金曜日」ということで「ジェイソン（JSON, JavaScript Object Notation）」の話をしようか悩んだのですが、予定通り、Ext.ux ネタでいきます。

私は Sencha のユーザーエクステンション開発が好きです。お作法にうるさいフレームワークの世界をちょっとはみ出して遊ぶ感じが、なんとも楽しいw そして、作ったもののいくつかは Sencha Inc. が配信している <a href="http://www.senchainsights.com" target="_blank">Sencha Insights</a> というメールマガジンで紹介してもらったりしました。

楽しいこともあったのですが、実を言うと、後悔していることもいくつかあります。今回の記事では、これからユーザーエクステンションの開発をしようと考えている方に向けて、いや、1年前の自分に向けて、気をつけておいた方がよいことを共有したいと思います。

<!--more-->

<h1>1. Sencha Architect</h1>

UX（ユーザーエクステンション）作者が気をつけるべき最初のポイントは「<a href="http://www.sencha.com/products/architect/" target="_blank">Sencha Architect</a>」対応です。せっかく UX を公開するのであれば、できるだけ多くの人に使ってもらいたいのは心情ですよね。で、どうやら Sencha ユーザーのそれなりの人数が Sencha Architect を使って開発しているようです。そのため、たくさんの人から「お前のコンポーネントは Sencha Architect で動きますか？」「やりかた教えてください？」「えっ！できないのー。。」みたいなことを言われました（※英語だったので意訳）。ちょうど Architect 3 から簡単に UX を組み込めるようになったこともあるので、これから開発される方は、Architect 対応を最初から意識して開発を始められるとよいと思います。

Sencha Cmd を使って、UX のプロジェクトの雛形を作れます。

<pre>
    sencha generate package -type code Ext.ux.AwesomeComponent
</pre>

<img src="/public/images/7step-1.png" alt="ux-project" width="100%" class="alignnone size-full wp-image-1267" />

Sencha Architect 対応の詳細は、公式ドキュメントで。

Creating App Templates and User Extensions:
<a href="http://docs.sencha.com/architect/3/#!/guide/ux_extend" target="_blank">http://docs.sencha.com/architect/3/#!/guide/ux_extend</a>

ちょうど数日前から、Sencha Inc.のブログで UX 開発のチュートリアルも始まりましたね！

Building a User Extension and Integrating It Into Sencha Architect 3 (Part 1):
<a href="http://www.sencha.com/blog/building-a-user-extension-and-integrating-it-into-sencha-architect-3-part-1/" target="_blank">http://www.sencha.com/blog/building-a-user-extension-and-integrating-it-into-sencha-architect-3-part-1/</a>

<h1>2. Test</h1>

例えば、私が作っている <a href="https://github.com/shinobukawano/Ext.ux.AccordionList" target="_blank">Ext.ux.AccordionList</a> という Sencha Touch のコンポーネントですが、、ごめんなさい。ちゃんとテストを書いてないです。ありがたいことにコンポーネントが多くの方に使われるようになると、「品質」が問題になってきます。上記のコンポーネントは残念ながら、あまり品質はよくないようで、GitHub リポジトリに頻繁に issue があがりますし、star よりも fork の方が多い状況です（star:20 に対して、fork: 22もある。。）。

また、送ってもらったパッチを気分よく取り込んだところ、基本的な機能（項目の開閉）ができなくなっていて、後日、別の人からクレームが来る、ということがありました。機能の修正によるデグレードを検知するためにも、テストはしっかり整備しておきたいところです。

最近、テストフレームワークを Jasmine から Siesta に乗り換えました。Siesta、いいですね！Siesta の一番の魅力は Sencha フレームワークとの親和性だと思います。Sencha のスタイルで書いているコードを Jasmine でテストしようとすると、どうテストコードを書こうか試行錯誤するのですが、Siesta の場合、最初からユースケースが想定されていて、それに従うだけでいいので、とっても楽チンです。まだ全然使いこなせていないですが、これらお世話になりたいと思っています。

Siesta | Bryntum:
<a href="http://www.bryntum.com/products/siesta/" target="_blank">http://www.bryntum.com/products/siesta/</a>

Testing Sencha Applications with Siesta:
http://vimeo.com/75277111

<h1>3. Documentation</h1>

作成したカスタムコンポーネントの使い方に関する質問を受けることが、多々ありました。ドキュメントをちゃんと整えていないことが原因の一つだと思います。せっかくの見込みユーザーを逃してしまう可能性もあるので、ドキュメントの整備は最初から気に留めておいた方がよいことの一つかと。Sencha には JSDuck という素晴らしいドキュメント生成ツールがあるので、ぜひぜひ利用させてもらいましょう。

JSDuck:
<a href="https://github.com/senchalabs/jsduck" target="_blank">https://github.com/senchalabs/jsduck</a>

Ext.ux.AccordionList のドキュメントでは、憧れのライブプレビューを組み込みました。

<a href="http://docs.shinobukawano.com/touch/#!/api/Ext.ux.AccordionList" target="_blank">http://docs.shinobukawano.com/touch/#!/api/Ext.ux.AccordionList</a>

実は、ライブプレビューのデバイス画像は JSDuck の標準機能ではなく <a href="https://github.com/senchalabs/jsduck/issues/269" target="_blank">Sencha Touch 向けのハック</a>のようです。デバイス画像を表示するには、ドキュメントビルド時に –touch-examples-ui という隠しオプションを true にする必要があるようです。

<img src="/public/images/7step-2.png" alt="live-preview" width="100%" class="alignnone size-full wp-image-1270" />

<h1>To Be Continued...</h1>

まだ、３つしか書いていないのですが、結構な文字数になりました。。お腹いっぱいだと思うので、今回はここまでで ^^; まだ書けてない、とか、そろそろ今日が終わりそう、とか、そういう理由では、、ないです。続きは、次回の担当日（12/24）に書きます。

明日は <a href="https://twitter.com/kotsutsumi" target="_blank">@kotsutsumi</a> さんです。Packt Publishing から出版予定の著書 ExtJS Data-Driven Application Design を紹介して頂けるという事で、とても楽しみにしています！どうぞよろしくお願いします〜( ﾟ∀ﾟ)ﾉ

