---
layout: post
title: "Tizen アプリを Sencha Touch で作ろう"
categories: 
css: jp-post
---

<img src="/public/images/try-tizen.png" alt="try-tizen" width="100%" class="alignnone size-full wp-image-1278" />

iOS、Android に続く第3のスマートデバイス用 OS として注目を浴びている <a href="https://www.tizen.org/" target="_blank">Tizen</a>（タイゼン）。Tizen の最大の特徴は「Web ベース OS」であるということ。Tizen のアプリは、HTML、CSS、JavaScript といった Web 技術を使って開発します（*）。ということは、、そうです、Sencha 開発者は、使い慣れた Sencha Touch を使って、Tizen アプリを作ることができるのです！という訳で、今回の記事では、Sencha Touch を使って Tizen アプリを作る手順をご紹介します。

* ... Tizen アプリは HTML5 で開発するのが主流ですが、C/C++ を使ってネイティブコードで動作するアプリケーションを開発することもできます。

<!--more-->

<h1>Installation</h1>

まずは開発の準備から。以下のサイトから Tizen SDK をダウンロードします。

Tizen SDK | Tizen Developers:
<a href="https://developer.tizen.org/ja/downloads/tizen-sdk" target="_blank">https://developer.tizen.org/ja/downloads/tizen-sdk</a>

SDK はインストールマネージャーを使ってインストールします。インストールマネージャーは、利用するプラットフォーム毎に用意されています。ここから先は、Mac OS X を開発マシンにする場合を想定して説明します。ダウンロードしたインストールマネージャーを実行すると、以下のウィンドウが表示されます。

<img src="/public/images/tizen1.png" alt="tizen-install-manager" width="80%" class="alignnone size-full wp-image-1280" />

ウィザードに従って SDK をインストールしますが、ここで一つ、注意点。インストールの際、インストールマネージャーがホームディレクトリ以下の tmp ディレクトリを利用するのですが、このディレクトリの所有者が root ユーザーになっていると、「Fatal error occurred while installing the Tizen SDK.」というエラーが出てインストール作業が中断します。その際は、

<pre>
$ chown -R $USER ~/tmp
</pre>

というコマンドを実行して、ディレクトリの所有権を変更して下さい。

無事にインストールが完了すると、Eclipse ベースの Tizen IDE や、Tizen エミュレータなどの開発ツールが使えるようになります。

<h1>Create App with Sencha Touch</h1>

それではアプリを作りましょう。まずは Sencha Cmd を使ってプロジェクトを作成します。

<pre>
$ sencha -s touch-2.3.1 generate app TizenApp tizenapp
</pre>

せっかく Tizen アプリを作るので、見た目を Tizen の OS に馴染むようにしたいですよね。そこで Sencha Touch 2.3.1 から新しく加わった Tizen テーマを利用します。「resources/sass」ディレクトリにある app.scss ファイルを以下のように書き変えます。

<pre class="prettyprint">
// 以下の2行をコメントアウト
// @import 'sencha-touch/default';
// @import 'sencha-touch/default/all';

// 以下の2行を追加
@import 'sencha-touch/tizen';
@import 'sencha-touch/tizen/all';
</pre>

.scss ファイルをコンパイルして、アプリケーションで利用する css を更新します。

<pre>
$ compass compile resources/sass

overwrite resources/sass/../css/app.css
</pre>

その後、ブラウザでアプリを表示すると、、Tizen テーマが適用されていることが分かりますね！

<img src="/public/images/tizen2.png" alt="tizen-theme-dark" width="100%" class="alignnone size-full wp-image-1282" />

デフォルトは暗い色合いですが、明るい色合いの Tizen テーマを利用することもできます。app.js の launch メソッド内に以下のコードを追加して下さい。

<pre>
    launch: function() {
        // 明るい色合いを指定します
        TizenApp.app.setThemeVariation('light');

        ...
</pre>

明るい色合いバージョンの Tizen テーマが適用されます。

<img src="/public/images/tizen3.png" alt="tizen-theme-light" width="100%" class="alignnone size-full wp-image-1283" />

<h1>Build & Run on Tizen!</h1>

それでは、Sencha Touch で作ったアプリを、Tizen アプリとして実行させてみましょう。

Tizen IDE を起動し、「File」->「New」から「Tizen Web Project」を選択すると、作成ダイアログが表示されます。ここでは Tizen アプリプロジェクトの最小構成である Basic テンプレートを使ってプロジェクトを作成します。テンプレートを選択した後、Project Name に任意のプロジェクト名を入力して、右下の「Finish」ボタンを押下。雛形のプロジェクトが生成されます。

続いて、Sencha Touch のアプリをビルドします。

<pre>
$ sencha app build production
</pre>

「build/production」ディレクトリ以下に出荷用のファイル一式が生成されます。Tizen IDE に戻って、Project Explorer でプロジェクトを選択した後、右クリックでメニューを表示します。「Import」を選択するとダイアログが表示されるので、「General」->「File System」を選択し、下の「Next >」ボタンを押下します。「build/production」ディレクトリに生成されたアプリケーションのディレクトリを選択し、そこに含まれる全てのファイルをインポートします。いくつかのファイルを上書きするので、「Overwrite existing resource without warning」オプションにチェックを入れておくとよいでしょう。

プロジェクトのルートディレクトリにある config.xml でアプリケーションのアイコンを指定できます。Sencha Touch アプリのビルドディレクトリ以下の「resources/icons」ディレクトリにある Icon@2x.png 画像がいい感じです。オプションで、アイコンを丸く切り抜くオプションと、アイコンに影をつけるオプションも有効にすると、さらにいい感じです。

<img src="/public/images/tizen4.png" alt="tizen-config" width="100%" class="alignnone size-full wp-image-1284" />

最後に、プロジェクトのソースを Tizen アプリとしてビルドして、エミュレータで実行させてみましょう。Tizen SDK をインストールしたディレクトリから tools > emulator > bin と進み、emulator-manager を起動します。画面の「+ Add New」をクリックし、右側の「Detail」欄の「Name」に任意の名前を入力して「Confirm」ボタンをクリックします。左側にデバイス画像が表示されたら、エミュレータの準備は完了です。

<img src="/public/images/tizen5.png" alt="tizen-emulator-manager" width="100%" class="alignnone size-full wp-image-1285" />

デバイス画像をダブルクリックして、エミュレータを起動させてみましょう。カッコいいですね :D

<img src="/public/images/tizen6.png" alt="tizen-emulator" width="40%" class="alignnone size-full wp-image-1286" />

Tizen IDE でプロジェクトを選択し、メニューバーから「Run」メニュー > 「Run As」から「1. Tizen Web Application」を選択します。ビルドが成功すると、エミュレータにアプリが表示されます。

<img src="/public/images/tizen7.png" alt="sencha-app-on-tizen" width="40%" class="alignnone size-full wp-image-1288" />

エミュレータにアプリをインストールするためには、開発者署名を設定しておく必要があります。開発者証明は、「tools/certificate-generator」にある certificate-generator.sh を実行して作成します。ガイダンスに従って必要事項を入力すると p12 ファイルが生成されます。IDE の「Preferences」->「Tizen SDK」->「Security Profiles」で「Add」ボタンを押して新しくプロファイルを作成し、「Author Certificate」で生成した p12 ファイルへのパスを指定して下さい。設定を変更した際は、IDE を再起動する必要があります。

<img src="/public/images/tizen8.png" alt="tizen-p12" width="100%" class="alignnone size-full wp-image-1289" />

<h1>Conclusion</h1>

Sencha Touch を使って Tizen アプリを作る手順について、駆け足で紹介しました。Tizen はドコモが発売を表明していることもあり、今後の日本市場において大きな存在となる可能性があります。まだ新しいプラットフォームなので、早い段階で参加すれば、より多くの人に使ってもらえるアプリの作者になれるかもですね！

実用的なアプリを作るとなると、ソースコードの複雑化が予想されます。Sencha Touch には、プログラムをクラスベースのオブジェクト指向で構築できる仕組みや、MVCアーキテクチャ、データパッケージなど、複雑な Web アプリを作るために頼りになる機能がたくさんあります。Tizen アプリを開発される方は、ぜひ一度、Sencha Touch の利用を検討してみてはいかがでしょうか :-)

