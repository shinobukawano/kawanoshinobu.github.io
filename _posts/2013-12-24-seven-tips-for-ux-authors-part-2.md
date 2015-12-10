---
layout: post
title: "ユーザーエクステンションを作る時に気をつけるべき7つのこと (Part2)"
categories: 
css: jp-post
---

<pre>
この記事は <a href="http://www.adventar.org/calendars/137" target="_blank">Sencha Advent Calendar 2013</a> の24日目の記事です。
</pre>

メリークリスマス！皆様、今宵はいかがお過ごしでしょうか？私は、会社帰りの喫茶店でこのエントリを書いております。。Sencha Advent Calendar 2013 も残すところ、あと2日ですね！今年も楽しく参加させて頂きました ^^

さて今回は、<a href="http://shinobukawano.com/2013/12/seven-tips-for-ux-authors/">前回、中途半端なところで終わった「ユーザーエクステンションを作る時に気をつけるべき7つのこと」</a>の続編です。

<!--more-->

<h1>4. Exclude Library</h1>
ユーザーエクステンションのデモサイトを作る際に、ライブラリのソースコードをどうするかは悩みどころですよね。リポジトリに含めるのはライセンス的に微妙ですし、ライブラリのアップデートでファイルを置き換えると更新履歴が大変なことになります。とはいえ、デモサイトは利用者が簡単に動かせるようにしておきたい。。という訳で、私は Sencha Cmd で生成される雛形プロジェクトの build.xml に以下のタスクを加えています。

<pre class="brush: html;">
&lt;!-- デモサイトのディレクトリの定義 --&gt;
&lt;property name=&quot;app.dir&quot; value=&quot;examples&quot;/&gt;

&lt;!-- 作業用ディレクトリの定義 --&gt;
&lt;property name=&quot;cache.dir&quot; location=&quot;.ux-ant-cache&quot;/&gt;

&lt;!-- ダウンロードする Sencha Touch のバージョンの定義 --&gt;
&lt;property name=&quot;touch.version&quot; value=&quot;2.3.1&quot;/&gt;

&lt;!-- CDN の定義 --&gt;
&lt;property name=&quot;touch.src&quot; value=&quot;http://cdn.sencha.io/touch/sencha-touch-${touch.version}-gpl.zip&quot;/&gt;

&lt;target name=&quot;initialize&quot;&gt;

    &lt;!-- 作業用ディレクトリの作成 --&gt;
    &lt;mkdir dir=&quot;${cache.dir}&quot;/&gt;

    &lt;!-- Sencha Touch の SDK をダウンロードする --&gt;
    &lt;get dest=&quot;${cache.dir}&quot; verbose=&quot;true&quot; skipexisting=&quot;true&quot;&gt;
        &lt;url url=&quot;${touch.src}&quot; /&gt;
    &lt;/get&gt;

    &lt;!-- SDK を作業用ディレクトリに展開する --&gt;
    &lt;unzip dest=&quot;${cache.dir}&quot;&gt;
        &lt;fileset dir=&quot;${cache.dir}&quot;&gt;
            &lt;include name=&quot;*.zip&quot;/&gt;
        &lt;/fileset&gt;
    &lt;/unzip&gt;

    &lt;!-- デモサイトのディレクトリにライブラリのソースコードをコピーする --&gt;
    &lt;copy todir=&quot;${app.dir}/touch&quot; includeEmptyDirs=&quot;false&quot;&gt;
        &lt;fileset dir=&quot;${cache.dir}/touch-${touch.version}&quot;&gt;
            &lt;exclude name=&quot;docs/**/*&quot; /&gt;
            &lt;exclude name=&quot;examples/**/*&quot;/&gt;
        &lt;/fileset&gt;
    &lt;/copy&gt;

    &lt;!-- 作業用ディレクトリを削除する --&gt;
    &lt;delete&gt;
      &lt;fileset dir=&quot;${cache.dir}&quot; /&gt;
    &lt;/delete&gt;
&lt;/target&gt;
</pre>

利用者は以下のコマンドを実行するだけで、デモサイトのディレクトリにライブラリを配置できる、という寸法です。

<pre>
$ sencha ant -f build.xml initialize
</pre>

<h1>5. Release</h1>
開発が完了したら、リリース作業に入ります。私は GitHub でリポジトリを管理しているのですが、実は少し前までタグを打っていませんでした。。今ではキリのよいタイミングでタグを打って tgz/zip アーカイブをダウンロードできるようにしています。

<pre>
# 1.1 という名称のタグを付ける
$ git tag -a 1.1 -m "New Version!"

# GitHub にプッシュ
$ git push --tags
</pre>

GitHub の Releases ページに追加したタグが表示され、tgz/zip アーカイブをダウンロードできるようになります。

<img src="/public/images/7step-3.png" alt="tag" width="100%" class="alignnone size-full wp-image-1304" />

リリースしたら、ぜひ Sencha Market に登録しましょう。Sencha Market に添付するアーカイブは上記のものを使えば楽チンですね。

Sencha Market:
<a href="https://market.sencha.com" target="_blank">https://market.sencha.com</a>

<img src="/public/images/7step-4.png" alt="senchamarket" width="100%" class="alignnone size-full wp-image-1335" />

Sencha Forum にある「<a href="http://www.sencha.com/forum/forumdisplay.php?105-Sencha-Touch-2.x-Examples-and-Showcases" target="_blank">Examples and Showcases</a>」で宣伝するのも、よいアイデアだと思います。

<h1>6. Maintenance</h1>
無事にリリースして、利用してくれる人が現れたら、メンテナンスのフェーズに入ります。この作業は利用者からのフィードバックがあり嬉しい反面、やらなければならない仕事が次々と増える、ということでもあります。。正直なところ、うまく捌けてなくて、放置してしまっている Issue がたくさんあります（ごめんなさい）。。Issue をサクサク解決できる開発者になることが、来年の密かな目標です。

GitHub にあがる Issue は通知が来るので気づくのですが、<a href="http://stackoverflow.com" target="_blank">Stack Overflow</a>（プログラミングに関するコミュニティサイト）であがった質問はほとんど見落としていました。自己解決されたり、他の誰かが助けたりしていましたが、自作コンポーネントの話題ですし、できればコメントしたいところです。

<img src="/public/images/7step-5.png" alt="stackoverflow" width="100%" class="alignnone size-full wp-image-1305" />

<h1>7. Enjoy!</h1>

メンテナンスは辛いのですが、やっぱり、それ以上に楽しいことの方が多いのが、ユーザーエクステンションの開発です。海外の見知らぬ誰かから感謝のメッセージを貰えるととても励みになりますし、どこかのアプリで自作コンポーネントが組み込まれていることを想像するとウキウキします。また、何度もやりとりした利用者の方とは、一緒にプロジェクトを進めているような気分になれて楽しいです。

<strong>楽しむこと</strong> ---

今回、気をつけるべきことをいろいろ書きましたが、多分、これだけ忘れなければ、あとはどうでもいいことだと思います。

というわけで、、駄文を書き散らしました。。明日は最終日ですね！<a href="https://twitter.com/kotsutsumi" target="_blank">@kotsutsumi</a> さん、どうぞよろしくお願いします(*・∀・*)

あ、そういえば、日本語の Sencha フォーラムが新しくなったみたいですね。複数あったスレッドが、ひとつにまとまったようです。

Japanese Sencha Forum:
<a href="https://www.sencha.com/forum/forumdisplay.php?35-Japanese-Sencha-Forum" target="_blank">https://www.sencha.com/forum/forumdisplay.php?35-Japanese-Sencha-Forum</a>

ユーザーエクステンションを作ったら、ぜひこのフォーラムで紹介して下さいっ :-)

Happy Coding!

