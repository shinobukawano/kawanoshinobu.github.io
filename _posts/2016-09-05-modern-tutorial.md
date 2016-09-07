---
layout: post
title: "Sencha Architect チュートリアル「First Modern Application」日本語訳"
categories: [sencha, extjs]
css: jp-post
ogimage: modern-employee-directory-parts
---

<pre>
Sencha Architectのチュートリアル「<a href="http://docs.sencha.com/architect/4/guides/tutorials/first_mobile_application.html" target="_blank">First Modern Application <i class="fa fa-external-link" aria-hidden="true"></i></a>」の日本語訳です。
</pre>

これから「従業員一覧」アプリケーションを作成します。本ガイドでは、Ext JS の Modern アプリを開発するための Architect 4.0 の基本的な使い方を学習します。

<img src="/public/images/modern-employee-directory-parts.jpg" style="width:80%"/>

**ステップ 1: Architect の開始**

まず初めに、Architect をダウンロードします。その後、空のプロジェクトを作成します。

  1. <a href="http://pages.sencha.com/architect-4-ea.html" target="_blank">ここ <i class="fa fa-external-link" aria-hidden="true"></i></a> から Architect をダウンロードします

  2. Architect をインストールして起動して下さい。必要な場合、トライアル登録もしくは継続して下さい。

  3. Architect の初期ダイアログで**「New Project」**をクリックします。

  4. 利用するフレームワークを選択します。「New Project」ウインドウの右上で「Ext JS 6.0.x Modern」を選んで下さい。

  5. プロジェクトの雛形を選択します。**「Blank Project」**を選択し、**「Create」**をクリックして下さい。これにより空のアプリケーションが作成されるので、そこにコンポーネントやロジックを追加して「従業員一覧」アプリを構築していきます。

**ステップ 2: タブパネルを追加しプロジェクトを保存する**

これから作成するアプリではナビゲーションにタブパネルを利用して、従業員一覧と企業情報タブの双方に遷移できるようにします。

  1. Architect の右側にある Toolbox で、"tab panel" と入力して検索します。その後、Container グループにある "Tab Panel" コンポーネントをデバイスのキャンバスに配置します。

  2. ツールバーの左上にある「Save」ボタンをクリックし、表示されるメニューにある「Save」をクリックします。

      1. **「Save Path」**でプロジェクトを保存したい場所を指定して下さい。

      2. **「Project Name」**にプロジェクト名を入力します。プロジェクト名は同時に上記で指定した場所に生成されるディレクトリ名となります。本チュートリアルでは「EmployeeDirectory」と入力して下さい。

      3. **「App Name」**にはアプリ名を入力します。この値はアプリケーションのそれぞれのクラスファイルで名前空間として利用されます。本チュートリアルでは「EmpDir」と入力して下さい。

      4. **「Save」**ボタンをクリックして下さい。

      <pre><i class="fa fa-info-circle" aria-hidden="true"></i> 注記: 他のプロジェクト（もしくは他のCmdで作成されたワークスペース）のディレクトリにプロジェクトを保存しないようにして下さい。</pre>

  3. 保存時に「Would you like to scan your project for references to the old application name?」のメッセージが出ますが、ここでは**「No」**をクリックして下さい。

  4. アプリケーションの作成過程をプレビューするには、"Preview App" ボタン <img src="/public/images/preview_app_button.png"/> をクリックします。保存ボタンの右側に配置されている「Preview button」をクリックして下さい。端末のデフォルトブラウザが起動し、アプリケーションの現在の画面が表示されます（デバイスのキャンバスにドラッグしたタブパネルが表示されます）。

**ステップ 3: 2つだけのタブを持つようTab Panelを更新**

この節ではアプリケーションの最終型で必要な画面だけを表示するようタブパネルを変更します。

  1. Project Inspector 領域の **MyTabPanel** を選択します。

  2. Toolbox 領域の下側にある領域は Config 領域です。ここではアプリケーションに含まれるコンポーネントや他のクラスの設定を変更することができます。「**Filter Configs...**」でコンフィグ名を入力することで Config 領域のフィールドを絞り込みできます。

  3. **userClassName** コンフィグの値を「MyTabPanel」から「Main」に変更して下さい。

  4. Project Inspector 領域で **Main** コンポーネント配下にある **Tab 2** コンポーネントの上で右クリック、「Delete」を選択して **Tab 2**を削除します。

  5. 続いて、**Tab 3** も削除して下さい。

  6. Toolbox 領域で "grid" と検索します。

  7. Project Inspector 領域にて "Grid" コンポーネントのインスタンスを **Tab 1** の上に追加し、Grid がタブパネルの最初のタブになるようにします（タブ名称は「New Tab」と表示されます）。

  8. **New Tab** を選択し、config 領域で　"title" と検索して下さい。その後、title コンフィグの値を "Employee Directory" に変更します。

      - 代わりに、中央のデザイン領域のデバイスキャンバスにあるタブの文字をダブルクリックして新しいテキストやタイトルを直接入力して変更することも可能です。

  9. "Employee Directory" タブにて、"iconCls" と入力し、絞り込み欄の右側にある「**Add**」をクリックして「iconCls」をカスタムコンフィグとして追加します。その後、「iconCls」の値に「x-fa fa-users」と入力して下さい。これによりタブにアイコン（Ext JS のテーマに含まれるアイコン集から取得）が追加されます。

  10. Project Inspector 領域で **Tab 2** を選択して下さい。その後、title を「About Sencha」に変更します。

  11. "About Sencha" タブにて、"iconCls" カスタムコンフィグを追加し、値に「x-fa fa-info-circle」を設定して下さい。

  12. **プレビュー**ボタンを押して、適用した更新を Architect の外で確認してみましょう。

      - もしプロジェクトを保存する前にプレビューボタンを押した場合は、保存を促すプロンプトが表示されます。

**ステップ 4: "About Sencha" パネルを Tab 2に追加**

ここでは、企業情報パネルに内容とスタイルを追加します。

  1. Project Inspector 領域で "About Sencha" タブを選択し、config 領域で "html" と検索します。その後、html コンフィグの値を下記に変更して下さい。

         <h1>About Sencha</h1><br/>More than 10,000 customers and 60% of the Fortune 100 rely on Sencha solutions to deliver innovative applications that drive their businesses. With a longstanding commitment to web technologies, Sencha dramatically reduces the cost and complexity of developing and delivering enterprise applications across multiple device types.<br/><br/><h2>Create feature-rich HTML5 applications using JavaScript</h2><br/>Sencha Ext JS is the most comprehensive MVC/MVVM JavaScript framework for building feature-rich, cross-platform web applications targeting desktops, tablets, and smartphones. Ext JS leverages HTML5 features on modern browsers while maintaining compatibility and functionality for legacy browsers.<br/><br/>Ext JS features hundreds of high-performance UI widgets that are meticulously designed to fit the needs of the simplest as well as the most complex web applications. Ext JS templates and layout manager give you full control over your display irrespective of devices and screen sizes. An advanced charting package allows you to visualize large quantities of data. The framework includes a robust data package that can consume data from any backend data source. Ext JS also offers several out-of-the-box themes, and complete theming support that lets you build applications that reflect your brand. It also includes an accessibility package (ARIA) to help with Section 508 compliance.

  2. "About Sencha" タブに余白を追加します。 padding コンフィグを検索し、値に「10」を設定して下さい。

  3. **保存**をクリックします。

  4. アプリケーションをプレビュー表示して確認下さい。

**Step 5: モデルの追加**

従業員一覧用のダミーデータを作成する前に、モデルを作成します。モデルはデータを表現するフィールドを持ち、グリッド等で利用されます。

  1. Project Inspector 領域にて、「+」ボタンをクリックし、ドロップダウンメニューから「**Model**」を選択します。

  2. Config Panel 領域にて「name」と検索し、"userClassName" の値を "MyModel" から "Employee" に変更して下さい。

  3. Config Panel 領域にて「fields」と検索します。

  4. fields コンフィグの右端にある「+」ボタンをクリックします。

  5. 「firstName, lastName, officeLocation, phoneNumber」と入力し、「**Finish**」をクリックして下さい。

  6. **保存**をクリックします。

**ステップ 6: ストアの追加**

続いて、従業員一覧ビューにデータを供給するためのデータストアをプロジェクトに追加します。Architectは従業員データが存在する場合にどのような表示・動作になるかを確認できるようモックデータを生成します。

  1. Project Inspector 領域にて「+」ボタンをクリックし、ドロップダウンメニューから「**Store**」の「**Json Store**」を選択して下さい。

  2. Config Panel 領域にて "name" と検索し、"userClassName" を "MyJsonStore" から "Employees" に変更して下さい。

  3. Project Inspector 領域の **Employees** ストア上で右クリック、その後「**Generate Mock Data**」を選択します。

  4. モックデータ生成ウィンドウにて 対象モデルのフィールドを指定するために **Employee** を選択し、「**Generate**」ボタンをクリックして下さい。

      <pre><i class="fa fa-info-circle" aria-hidden="true"></i> 注記: もしモックデータを生成しない場合で、Employees ストアに Employee モデルを関連付けたい場合は、ストアの「model」コンフィグのドロップダウンオプションで「Employee」を選択して下さい。</pre>

  5. **保存**をクリックします。

**ステップ 7: 従業員一覧のグリッドを設定する**

従業員一覧のグリッドはタブとして既に追加されていますが、まだ Employees データストアから従業員データを表示するための設定ができていません。下記の手順では、従業員一覧のグリッドの設定を行い、また各々のカラムにデータストアのどのフィールドの値を表示させるかを設定します。

  1. Project Inspector 領域の Application > Views > Main 配下にある Employee Directory を選択します。

  2. Config Panel にて "columns" と検索し、「**String**」カラム以外は各項目の隣になる「X」アイコンをクリックして全て削除して下さい。

  3. Columns コンフィグで、行の「+」ボタンをクリックすると表示されるドロップダウンメニューから「Column」を選択して、2つのカラムを追加して下さい。

  4. Config 領域にて "store" と検索し、store コンフィグのドロップダウンリストで "Employees" を選択します。

  5. Project Inspector 領域で Emproyee Directory グリッド配下の "String" カラムを選択します。

  6. Config 領域で　"text" コンフィグを検索し、値を「String」から「First Name」に変更します。

  7. "dataIndex" コンフィグを検索し、detaIndex のドロップダウンリストから「firstName」を選択します。

  8. Project Inspector 領域で "MyColumn2" を選択します。

  9. Config Panel にて "text" コンフィグを検索し、値を「MyColumn2」から「Last Name」に変更して下さい。

  10. "dataIndex" コンフィグを検索し、値に「lastName」を選択します。

  11. Project Inspector 領域で "MyColumn3" を選択します。

  12. Config Panel にて "text" コンフィグを検索し、値を「MyColumn3」から「Phone Number」に変更して下さい。

  13. "dataIndex" コンフィグを検索し、値に「phoneNumber」を選択します。

  14. 全てのカラムにて "width" コンフィグを検索し、値に「120」を設定して下さい。

  15. アプリをプレビュー表示します。

      <pre><i class="fa fa-medkit" aria-hidden="true"></i> 訳注: ステップ8はありません。</pre>

**ステップ 9: フォームパネルの追加**

従業員一覧が完成したので、次は従業員レコードの詳細を確認・変更するためのフォームを作成します。

  1. Toolbox 領域にて "form" と検索し、"Form Panel"のインスタンスを Project Inspector 領域の "Views" 直下にドラッグします。

  2. Config Panel にて "name" と検索し、「userClassName」の値を「MyFormPanel」から「UpdateRecordForm」に変更して下さい。

  3. "title" を検索し、値を「My Form」から「Update Record」に変更して下さい。

  4. "modal" を検索し、選択（チェック）して下さい。

  5. "centered" を検索し、選択して下さい。

  6. Toolbox 領域にて "text field" を検索します。

  7. "Text Field" をデバイスキャンバス上の Update Record フォームパネルにドラッグ＆ドロップして下さい。この作業をあと3回繰り返し、合計で4つのテキストフィールドが "Update Record" フォームに含まれるようにします。

  8. 最初のテキストフィールドを選択し（デザインビューでも Project Inspector 領域でもどちらでも構いません）、"label" コンフィグを検索します。その後、値を「Field」から「First Name」に変更して下さい。同じ作業をそれぞれのテキストフィールドで繰り返します。設定する label コンフィグの値は右記の通りです。「First Name」「Last Name」「Office Location」「Phone Number」

  9. Toolbox 領域で "toolbar" を検索し、Toolbar をフォームパネル上に配置して下さい。

  10. ツールバーを選択し "docked" コンフィグを検索します。その後、値の選択肢で「bottom」を設定して下さい、

  11. **保存**をクリックします。

**ステップ 10: フォームパネルへのボタンの追加**

続いて、Update Record フォームにボタンを追加します。それらのボタンは編集を保存して従業員一覧に戻るものと、編集を取り消してフォームを閉じるものです。（後半の手順でフォームにバインドしたレコードを保存します）

  1. Toolbox 領域で "button" を検索します。Button インスタンスをドラッグし、デバイスキャンバスのツールバー上にドロップして下さい。

  2. "text" コンフィグを検索し、値を「MyButton」から「Submit」に変更して下さい。

  3. "iconCls" コンフィグを検索し、値に「x-fa fa-check」を入力下さい。

  4. "event" を検索し「+」ボタンをクリック、続いて「**View Controller Event Bindings**」を選択して下さい。

  5. "tap" と入力し「**Finish**」ボタンをクリックします。これにより、**View Controller Event Bindings** 配下に「onButtonTap tap」項目が追加されます。「onButtonTap」はメソッドの名称で、ボタンをタップした際に実行されます。

  6. onButtonTap 項目にある「->」ボタンをクリックします。その後、"fn" コンフィグの値を「onButtonTap」から「**submitUpdate**」に変更します。これにより「submitUpdate」メソッドが Update Form の View Controller に追加されます。

  7. Project Inspector 領域にて **UpdateRecordFormViewController** 配下にある submitUpdate 項目をダブルクリックして下さい。この操作により、submitUpdate メソッドのコードビューが表示されます（**注記: メイン領域のデザインビューがコードビューに切り替わります**）。submitUpdate メソッドに下記のコードを記述して下さい。

         var view = this.getView(),
             record = view.getRecord();
         view.destroy();
         record.commit();

  8. 右上のチェックマークボタンをクリックして変更を確定します。

  9. 中央領域の右上にある切替ボタン「**Design**」を押下してデザインビューに戻って下さい。

  10. 新しく Button インスタンスをドラッグして、デバイスキャンバス上のツールバーにドロップして下さい。

  11. "text" コンフィグを検索し、値を「MyButton1」から「Cancel」に変更して下さい。

  12. "iconCls" コンフィグを検索し、値に「x-fa fa-close」を設定して下さい。

  13. "event" を検索し「+」ボタンをクリック、続いて「**View Controller Event Bindings**」を選択して下さい。

  14. "tap" と入力し、「**Finish**」ボタンをクリックして下さい。

  15. onButtonTap 項目にある「->」ボタンをクリックします。その後、"fn" コンフィグの値を「onButtonTap」から「**cancelUpdate**」に変更します。

  16. Project Inspector 領域にて **UpdateRecordFormViewController** 配下にある cancelUpdate 項目をダブルクリックして下さい。その後、cancelUpdate メソッドに下記のコードを記述します。

          var view = this.getView(),
              record = view.getRecord();
          view.destroy();
          record.reject();

  17. 右上のチェックマークボタンをクリックして変更を確定します。

  18. 保存をクリックします。

**ステップ 11: Employee Grid から Form Panel フォームを表示**

続いて、グリッドの行にクリックもしくはタップされた際に実行する Update Record フォームを表示するためのロジックを追加します。

  1. Project Inspector 領域にて　**Employee Directory** (Application > Views > Main > Employee Directory) をクリックして下さい。

  2. "event" を検索し「+」ボタンをクリック、続いて「**View Controller Event Bindings**」を選択して下さい。

  3. "itemtap" と入力し、「**Finish**」ボタンをクリックして下さい。

  4. onGridItemTap 項目にある「->」ボタンをクリックします。その後、"fn" コンフィグの値を「onGridItemTap」から「**onPopupForm**」に変更します。

  5. Project Inspector 領域にて **MyTabPanelViewController** 配下にある onPopupForm 項目をダブルクリックして下さい。その後、onPopupForm メソッドに下記のコードを記述します。

         Ext.Viewport.add({
             xtype: 'updaterecordform',
             width: 400,
             record: record,
             viewModel : {
                 data: {
                     employee: record
                 }
             }
         });

   6. 右上の "checkmark" ボタンをクリックして変更を確定します。

   7. アプリをプレビューします。グリッドの行をクリックして Update Record フォームが表示されることを確認して下さい。

**ステップ 12: フォームへのデータのバインディング**

最後に、従業員レコードを編集するために、フォームにデータをバインディングする設定を行います。バインディングは前の項で行ったビューモデルの **updaterecordform** の設定を利用します。レコードはビューモデルの Employee レコードの各キーと関連付けられます。各テキストフィールドに値をバインディングするために、Employee レコードの全てのフィールドを下記手順で利用します。


  1. Project Inspector 領域で「First Name」テキストフィールド（Application > Views > UpdateRecordForm > MyTextField）を選択して下さい。

  2. "bind" コンフィグを検索し「**Edit**」ボタン <img src="/public/images/edit-config-button.png"/>  をクリックして下さい。

  3. コードビューが表示されるので、値に「'{employee.firstName}'」を入力し、チェックマークをクリックして変更を確定します。

  4. 「Last Name」テキストフィールド（MyTextField1）を選択し、bind コンフィグを検索、値に「'{employee.lastName}'」を設定して下さい。

  5. 「Employee Location」テキストフィールド（MyTextField2）を選択し、bind コンフィグを検索、値に「'{employee.officeLocation}'」を設定して下さい。

  6. 「Phone Number」テキストフィールド（MyTextField3）を選択し、bind コンフィグを検索、値に「'{employee.phoneNumber}'」を設定して下さい。

  7. アプリをプレビューします。グリッドの行をクリック/タップするとポップアップフォーム内にレコードが読み込まれます。そして、4つのフィールドにレコードの値が表示され、「Submit」ボタンを押下することで現在表示中のレコードの変更を確定し、「Cancel」ボタンを押下することで変更を取り消すことができます。

以上でチュートリアルは完了です。お疲れ様でした。
