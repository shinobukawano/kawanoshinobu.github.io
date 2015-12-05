---
layout: post
title: "Ext JS 6 デモアプリ「Sencha CRM」を作りました"
categories: [sencha, extjs]
css: jp-post
ogimage: crm-v01-hero
---

<!-- なんだか毎年、アウェイな気分でアドベントカレンダーに参加しています、川野です ^^;   
<a href="http://www.adventar.org/calendars/1041" target="_blank">Sencha Advent Calendar 2015</a> - 6日目を担当しますので、よろしくお願いします。 -->

これは <a href="http://www.adventar.org/calendars/1041" target="_blank">Sencha Advent Calendar 2015</a> の6日目の記事です。

11月に数日間、自由に使える日があったので、Ext JS 6の勉強も兼ねてちょっとしたSenchaアプリを作りました。 シンプルなCRUD機能を持つユニバーサル（デスクトップ + モバイル）アプリで、PostgreSQLにデータを永続化します。
動きは下記の動画をご覧ください。

<iframe src="https://player.vimeo.com/video/147315133" width="500" height="323" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

そのままお蔵入りにしても良かったのですが、もしかしたら誰かの役に立つかもしれないと思い、ソースコードをGitHubで公開しました。READMEの手順に従えば、手元のPCでアプリを動かすことができるかと思います。

<a href="https://github.com/kawanoshinobu/SenchaCRM" target="_blank">https://github.com/kawanoshinobu/SenchaCRM</a>  
* Herokuボタンを付けたので、ワンクリックでご自身のHerokuアカウントにアプリをデプロイできます。

<img src="/public/images/crm-v01-hero.jpg" style="width:80%"/>

# Some useful tips on Ext JS 6

これだけだと宣伝みたいなので、Ext JS 6でデモアプリを作る過程で気づいた技術的なTipsを何点か共有します。

### 1. lookupメソッド

Ext JS 5でViewControllerクラスが追加され、そのスコープではコンポーネントを`reference`という識別子を利用して取得できるようになりました。

ただ、このreferenceでコンポーネントを取得するためのメソッドが`lookupReference`という名前でかなり長い。これはタイプ数が多いですし、間違えます。

Ext JS 6では`lookupReference`のショートハンドとして`lookup`メソッドが追加されました。下記はその利用例です。

    // SenchaCRM/src/main/resources/public/app/view/people/Controller.js
    onSaveFormButtonClick: function () {
        var me = this,
            window = Ext.first('people-detail'),
            record = me.getViewModel().getData().person;

        var fields = [
            me.lookup('firstname'),
            me.lookup('lastname')
        ];
        var results = Ext.Array.map(fields, function (f) {
            return f.validate();
        });
        ...

`lookupReference`はよく使う機能なので、記述が楽になるのは嬉しいです。

### 2. Ext.all & Ext.firstメソッド

「タイプ数が多い」というと`Ext.ComponentQuery.query`メソッドも一緒でしょう。
`Ext.ComponentQuery.query`はグローバルのスコープでコンポーネントを取得する手段ですが、これも「タイプ数が多い」とコミュニティで不評だった記憶があります。

Ext JS 6では、やっと便利なショートハンドができました。`Ext.all`が`Ext.ComponentQuery.query`のショートハンドになっています。

また、`Ext.ComponentQuery.query`は戻り値が配列になっており、よく下記のようなコードを目にしました。

    var myComp = Ext.ComponentQuery.query('mycomp')[0];

取得できるコンポーネントが一つであることが分かっている場合は、`Ext.first`メソッドで代替できます。

    // var myComp = Ext.ComponentQuery.query('mycomp')[0];
    var myComp = Ext.first('mycomp');

スッキリして、いいですね。このショートハンドもExt JS 6から追加されたものです。

### 3. Productionビルドで動かない時は

ありますよね、こういう時。今回、何度か遭遇しました。

Productionビルドで生成したアプリを表示すると、真っ白な画面で、コンソールに下記のようなエラーログが出力される。

<img src="/public/images/crm-p-error.png" style="width:80%"/>

「MyApp/.js 404 (Not Found)」てなんやねん。と思う前に、こういう時は焦らずビルドレベルを「Testing」に下げて、エラーログを確認してみて下さい。

<img src="/public/images/crm-t-error.png" style="width:80%"/>

今度はさっきより、まともなエラーログが出ました。どうやら`Ext.plugin.Viewport`クラスのrequires追加漏れのようです。

※開発時には、クラスのファイルが動的に読み込まれるため、requiresの定義が漏れていても問題なく動くことがあります。

「Productionビルドで動かないケースではTestingビルドでエラーログを確認する」というアドバイスで記事を締めたいと思います。

それでは、良いお年を！  
Happy X'mas!
