---
layout: post
title: "Sencha Touch Tutorial: メモ帳アプリを作る #最終回"
categories: tutorial
css: jp-post
---

<a href="/public/images/i-memo-app-tutorial2.png"><img src="/public/images/i-memo-app-tutorial2.png" alt="" title="i-memo-app-tutorial" width="601" height="261" class="aligncenter size-full wp-image-564" /></a>



<a href="http://www.adventar.org/calendars/23">Sencha Advent Calendar 2012</a> の21日目の記事です。



<a href="http://shinobukawano.com/2012/12/tutorial-7/">前回</a>、最終回のつもりが予想以上に長くなってしまったので、残りを今回で説明します。今回は、アプリのビルド・デプロイと、ネイティブパッケージングについて取り上げます。



<!--more-->

<h2><strong>ビルド</strong></h2>

アプリのビルドは、Sencha Cmd で行います。Sencha Cmd のビルドには、以下の4種類があります。



<ul>
<li>testing</li>
<li>package</li>
<li>production</li>
<li>native</li>
</ul>

今回は、製品としてリリースするので、production ビルドを行います。プロジェクトのルートディレクトリに移動して、以下のコマンドを実行して下さい。



<pre><code>$ sencha app build production
</code></pre>

build というディレクトリが作成され、そのディレクトリの {$アプリ名}/production ディレクトリ配下に、製品用のファイル一式が生成されます。



<pre><code>build
└── Memo
    └── production
        ├── app.js
        ├── app.json
        ├── cache.appcache
        ├── deltas
        │   └── app.js
        │       └── 7bd2b7870679209c1aa58105a2ebf524bb881e48.json
        ├── index.html
        └── resources
            ├── css
            │   └── app.css
            ├── icons
            │   ├── Icon.png
            │   ├── Icon@2x.png
            │   ├── Icon~ipad.png
            │   ├── Icon~ipad@2x.png
            │   ├── iTunesArtwork.png
            │   ├── icon-spot~ipad.png
            │   └── ios-memo-icon.png
            ├── images
            │   └── memo-bg.png
            └── startup
                ├── 1496x2048.png
                ├── 1536x2008.png
                ├── 320x460.jpg
                ├── 640x920.png
                ├── 748x1024.png
                └── 768x1004.png
</code></pre>

ブラウザで、memo/build/Memo/production にアクセスして下さい。製品ビルド版のメモ帳アプリが表示されます。



<a href="/public/images/t-b-14.png"><img src="/public/images/t-b-14.png" alt="" title="t-b-14" width="320" height="530" class="alignnone size-full wp-image-589" /></a>



製品ビルド版のアプリは、モバイル端末で快適に利用してもらえるよう、いくつかの最適化が加えられます。ファイルを圧縮して小さくすることはもちろん、JavaScript や CSS ファイルを文字列として localStorage にキャッシュして、2回目以降の起動を速くする工夫が行われます。



ブラウザをリロードして、デベロッパーツールの Network タブを開いて下さい。通信がほとんど行われていないことを確認できます。



<a href="/public/images/t-b-15.png"><img src="/public/images/t-b-15.png" alt="" title="t-b-15" width="100%" class="alignnone size-full wp-image-590" /></a>



<h3><strong>デプロイ</strong></h3>

アプリのデプロイは、build/{$アプリ名}/production ディレクトリ配下にある一式をアップすれば完了です。私は、GitHub ページにメモ帳アプリをホストしました。以下の URL で、今回作成したアプリを利用することができます。



<a href="http://shinobukawano.github.com/memo/">http://shinobukawano.github.com/memo/</a>



<h3><strong>ネイティブパッケージング</strong></h3>

Sencha Cmd を使うことで、コマンドひとつでネイティブアプリにパッケージングできます。ただ、事前の準備が必要なのですが、説明のボリュームが大きいので、今回は割愛させて頂きます。Mac OS X で XCode が既にインストールされている場合、以下のコマンドを実行するだけで、パッケージングされた Sencha Touch アプリをシミュレータで利用できます。



<pre><code>$ sencha package run packager.json
</code></pre>

シミュレータが起動し、アプリケーションが表示されました。



<a href="/public/images/b-t-161.png"><img src="/public/images/b-t-161.png" alt="" title="b-t-16" height="500" class="alignnone size-full wp-image-592" /></a>



<h2><strong>まとめ</strong></h2>

というわけで、全8回に分けて連載した「Sencha Touch でメモ帳アプリを作る」チュートリアルは、以上で終了です。お疲れさまでした。



作成したアプリのソースコードは、GitHub にアップしています。今回の説明で取り上げていない変更も追加しているのですが、ぜひ参考にして下さい。



<a href="https://github.com/shinobukawano/memo">https://github.com/shinobukawano/memo</a>



今週の月曜日、<a href="http://www.publickey1.jp/blog/12/facebookhtml5html5facebooksencha_touch.html">Sencha が発表した「fastbook」が、かなり大きな話題</a>になっていますね。今回のチュートリアルが、「Sencha Touch 始めてみようかな」と思った方の、よい助けになれば、非常に幸いです。



そして、素敵なアプリができたら、ぜひ、<a href="http://www.meetup.com/Japan-Sencha-User-Group/">Sencha のユーザーグループ</a>で発表して下さい！ただいま、スピーカーを絶賛募集中です (=ﾟωﾟ)ﾉ



さて、<a href="http://www.adventar.org/calendars/23">Sencha Advent Calendar</a> も、そろそろフィナーレです。明日は、<a href="https://twitter.com/Tkashiro">@Tkashiro</a> さんです。ここまで無事に辿り着けたのは、@Tkashiro さんの貢献が大きいと思っています（3回も記事を書いてくれましたb）。明日も、どうぞよろしくお願いします！



（追記）チュートリアルの感想を、<a href="https://twitter.com/shinobukawano">@shinobukawano</a> 宛にメンション頂けると、とても喜びます！



