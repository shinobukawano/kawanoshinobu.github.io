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

これから「従業員一覧」アプリを作成します。本ガイドでは Sencha Architect 4.0 を使って Ext JS の Modern アプリケーションを開発するための基礎知識を学習します。

<img src="/public/images/modern-employee-directory-parts.jpg" style="width:80%"/>

**ステップ 1: Architect の開始**

まず初めに、Architect をダウンロードします。その後、空のプロジェクトを作成します。

  1. <a href="http://pages.sencha.com/architect-4-ea.html" target="_blank">ここ <i class="fa fa-external-link" aria-hidden="true"></i></a> から Architect をダウンロードします

  2. Architect をインストールして起動して下さい。必要な場合、トライアル登録もしくは継続して下さい。

  3. Architect の初期ダイアログで「New Project」をクリックします。

  4. 利用するフレームワークを選択します。「New Project」ウインドウの右上で「Ext JS 6.0.x Modern」を選んで下さい。

  5. プロジェクトの雛形を選択します。「Blank Project」を選択し、「Blank Project」をクリックして下さい。これにより空のアプリケーションが作成されるので、そこにコンポーネントやロジックを追加して「従業員一覧」アプリを構築していきます。

**ステップ 2: タブパネルを追加しプロジェクトを保存する**

これから作成するアプリではナビゲーションにタブパネルを利用して、従業員一覧と企業情報タブの双方に遷移できるようにします。

  1. Architect の右側にある Toolbox で、"tab panel" と入力して検索します。その後、Container グループにある "Tab Panel" コンポーネントをデバイスのキャンバスに配置します。

  2. ツールバーの左上にある「Save」ボタンをクリックし、表示されるメニューにある「Save」をクリックします。

      1. 「Save Path」でプロジェクトを保存したい場所を指定して下さい。

      2. 「Project Name」にプロジェクト名を入力します。プロジェクト名は同時に上記で指定した場所に生成されるディレクトリ名となります。本チュートリアルでは「EmployeeDirectory」と入力して下さい。

      3. 「App Name」にはアプリ名を入力します。この値はアプリケーションのそれぞれのクラスファイルで名前空間として利用されます。本チュートリアルでは「EmpDir」と入力して下さい。

      4. 「Save」ボタンをクリックして下さい。

      <pre><i class="fa fa-info-circle" aria-hidden="true"></i> 注記: 他のプロジェクト（もしくは他のCmdで作成されたワークスペース）のディレクトリにプロジェクトを保存しないようにして下さい。</pre>

  3. 保存時に「Would you like to scan your project for references to the old application name?」のメッセージが出ますが、ここでは「No」をクリックして下さい。

  4. アプリケーションの作成過程をプレビューするには、"Preview App" ボタン <img src="/public/images/preview_app_button.png"/> をクリックします。保存ボタンの右側に配置されている「Preview button」をクリックして下さい。端末のデフォルトブラウザが起動し、アプリケーションの現在の画面が表示されます（デバイスのキャンバスにドラッグしたタブパネルが表示されます）。

**ステップ 3: 2つだけのタブを持つようTab Panelを更新**

この節ではアプリケーションの最終型で必要な画面だけを表示するようタブパネルを変更します。

  1. Project Inspector 領域の MyTabPanel を選択します。

  2. Toolbox 領域の下側にある領域は Config 領域です。ここではアプリケーションに含まれるコンポーネントや他のクラスの設定を変更することができます。「Filter Configs...」でコンフィグ名を入力することで Config 領域のフィールドを絞り込みできます。

  3. userClassName コンフィグの値を「MyTabPanel」から「Main」に変更して下さい。

  4. Project Inspector 領域で Main コンポーネント配下にある Tab 2 コンポーネントの上で右クリック、「Delete」を選択して Tab 2を削除します。

  5. 続いて、Tab 3 も削除して下さい。

  6. Toolbox 領域で "grid" と検索します。

  7. Project Inspector 領域にて "Grid" コンポーネントのインスタンスを Tab 1 の上に追加し、Grid がタブパネルの最初のタブになるようにします（タブ名称は「New Tab」と表示されます）。

  8. New Tab を選択し、config 領域で　"title" と検索して下さい。その後、title コンフィグの値を "Employee Directory" に変更します。

      - 代わりに、中央のデザイン領域のデバイスキャンバスにあるタブの文字をダブルクリックして新しいテキストやタイトルを直接入力して変更することも可能です。

  9. "Employee Directory" タブにて、"iconCls" と入力し、絞り込み欄の右側にある「Add」をクリックして「iconCls」をカスタムコンフィグとして追加します。その後、「iconCls」の値に「x-fa fa-users」と入力して下さい。これによりタブにアイコン（Ext JS のテーマに含まれるアイコン集から取得）が追加されます。

  10. Project Inspector 領域で Tab 2 を選択して下さい。その後、title を「About Sencha」に変更します。

  11. "About Sencha" タブにて、"iconCls" カスタムコンフィグを追加し、値に「x-fa fa-info-circle」を設定して下さい。

  12. プレビューボタンを押して、適用した更新を Architect の外で確認してみましょう。

      - もしプロジェクトを保存する前にプレビューボタンを押した場合は、保存を促すプロンプトが表示されます。

**ステップ 4: "About Sencha" パネルを Tab 2に追加**

ここでは、企業情報パネルに内容とスタイルを追加します。

  1. Project Inspector 領域で "About Sencha" タブを選択し、config 領域で "html" と検索します。その後、html コンフィグの値を下記に変更して下さい。

         <h1>About Sencha</h1><br/>More than 10,000 customers and 60% of the Fortune 100 rely on Sencha solutions to deliver innovative applications that drive their businesses. With a longstanding commitment to web technologies, Sencha dramatically reduces the cost and complexity of developing and delivering enterprise applications across multiple device types.<br/><br/><h2>Create feature-rich HTML5 applications using JavaScript</h2><br/>Sencha Ext JS is the most comprehensive MVC/MVVM JavaScript framework for building feature-rich, cross-platform web applications targeting desktops, tablets, and smartphones. Ext JS leverages HTML5 features on modern browsers while maintaining compatibility and functionality for legacy browsers.<br/><br/>Ext JS features hundreds of high-performance UI widgets that are meticulously designed to fit the needs of the simplest as well as the most complex web applications. Ext JS templates and layout manager give you full control over your display irrespective of devices and screen sizes. An advanced charting package allows you to visualize large quantities of data. The framework includes a robust data package that can consume data from any backend data source. Ext JS also offers several out-of-the-box themes, and complete theming support that lets you build applications that reflect your brand. It also includes an accessibility package (ARIA) to help with Section 508 compliance.

  2. "About Sencha" タブに余白を追加します。 padding コンフィグを検索し、値に「10」を設定して下さい。

  3. 保存をクリックします。

  4. アプリケーションをプレビュー表示して確認下さい。

**Step 5: モデルの追加**

従業員一覧用のダミーデータを作成する前に、モデルを作成します。モデルはデータを表現するフィールドを持ち、グリッド等で利用されます。

  1. Project Inspector 領域にて、「+」ボタンをクリックし、ドロップダウンメニューから「Model」を選択します。

  2. Config Panel 領域にて「name」と検索し、"userClassName" の値を "MyModel" から "Employee" に変更して下さい。

  3. Config Panel 領域にて「fields」と検索します。

  4. fields コンフィグの右端にある「+」ボタンをクリックします。

  5. 「firstName, lastName, officeLocation, phoneNumber」と入力し、「Finish」をクリックして下さい。

  6. 保存をクリックします。

**ステップ 6: ストアの追加**

続いて、従業員一覧ビューにデータを供給するためのデータストアをプロジェクトに追加します。Architectは従業員データが存在する場合にどのような表示・動作になるかを確認できるようモックデータを生成します。

  1. Project Inspector 領域にて「+」ボタンをクリックし、ドロップダウンメニューから「Store」の「Json Store」を選択して下さい。

  2. Config Panel 領域にて "name" と検索し、"userClassName" を "MyJsonStore" から "Employees" に変更して下さい。

  3. Project Inspector 領域の Employees ストア上で右クリック、その後「Generate Mock Data」を選択します。

  4. モックデータ生成ウィンドウにて 対象モデルのフィールドを指定するために "Employee"を選択し、「Generate」ボタンをクリックして下さい。

      <pre><i class="fa fa-info-circle" aria-hidden="true"></i> 注記: もしモックデータを生成しない場合で、Employees ストアに Employee モデルを関連付けたい場合は、ストアの「model」コンフィグのドロップダウンオプションで「Employee」を選択して下さい。</pre>

  5. 保存をクリックします。

**ステップ 7: 従業員一覧のグリッドを設定する**

従業員一覧のグリッドはタブとして既に追加されていますが、まだ Employees データストアから従業員データを表示するための設定ができていません。下記の手順では、従業員一覧のグリッドの設定を行い、また各々のカラムにデータストアのどのフィールドの値を表示させるかを設定します。

  1. Project Inspector 領域の Application > Views > Main 配下にある Employee Directory を選択します。

  2. Config Panel にて "columns" と検索し、「String」カラム以外は各項目の隣になる「X」アイコンをクリックして全て削除して下さい。

  3. Columns コンフィグで、行の「+」ボタンをクリックすると表示されるドロップダウンメニューから「Column」を選択して、2つのカラムを追加して下さい。

  4. In the config pane search for "store" and select “Employees” from the store config’s drop down option

  5. Select the "String" column from the Project Inspector pane under the Employee Directory grid item

  6. In the config pane search for "text" and change the value from “String” to “First Name”

  7. Search for the "dataIndex" config and select “firstName” from the dataIndex config’s drop down option

  8. Select "MyColumn2" from the Project Inspector pane

  9. In the config panel search for "text" and change the value from “MyColumn2” to “Last Name”

  10. Search for the "dataIndex" config and select “lastName” for the dataIndex config

  11. Select "MyColumn3" from the Project Inspector pane

  12. In the config panel search for "text" and change the value from “MyColumn3” to “Phone Number”

  13. Search for the "dataIndex" config and select “phoneNumber” for the dataIndex config

  14. For each column search for the "width" config and set the value to 120

  15. Preview the app

*ステップ8は見当たらない*

**Step 9: Add Form Panel**

With the employee grid finished we’ll now create a form used to view and modify the details of an employee record.

  1. In the Toolbox pane search for "form" and drag a “Form Panel” instance on to the Views node in the Project Inspector pane

  2. Search for "name" in config panel and change “userClassName” from “MyFormPanel” to “UpdateRecordForm”

  3. Search for "title" and change it from “My Form” to “Update Record”

  4. Search for the "modal" and select (check) it

  5. Search for "centered" and select it

  6. Search for "text field" in the Toolbox pane

  7. Drag a "Text Field" component on to the device canvas and drop it on the Update Record form panel. Do this three more times so that there is a total of four text fields on the “Update Record”.

  8. Select the first text field (from either the design view or within the Project Inspector pane) and search for the "label" config. Change the label from “Field” to “First Name”. Do the same for each text field using the labels: First Name, Last Name, Office Location, and Phone Number.

  9. Search for "toolbar" in the Toolbox pane and drag a Toolbar on to the Fom Panel

  10. With the toolbar selected search for the "docked" config and set its value to “bottom” using the drop down

  11. Click Save

**Step 10: Add Buttons to Form Panel**

Next, you’ll add buttons to the Update Record form that will either save edits back to the employee record or cancel the edit and close the form (we’ll save the binding of the record to the form itself for a later step).

  1. Search for "button" in the Toolbox pane. Drag a “Button” instance and drop it on top of the toolbar in the device canvas.

  2. Search for the "text" config and change the value from “MyButton” to “Submit”

  3. Search for the "iconCls" config and enter a value of “x-fa fa-check”

  4. In the config search input "event" and click the “+” next to View Controller Event Bindings and.

  5. Enter "tap" and click the Finish button. This will add an “onButtonTap tap” item under View Controller Event Bindings where “onButtonTap” is the name of the method to execute when the button is tapped.

  6. Click the "->" button on the “onButtonTap” item. Change the “fn” value from “onButtonTap” to “submitUpdate”. This will add the “submitUpdate” method to the “Update Form”s View Controller.

  7. In the Project Inspector pane double-click on the submitUpdate item under the UpdateRecordFormViewController node. This will open up the code view for the submitUpdate method (note that the **Design view has now switched over to the Code** view in the main pane). Enter the following code for the submitUpdate method:

         var view = this.getView(),
             record = view.getRecord();
         view.destroy();
         record.commit();

  8. Press the "checkmark" button top-right of the code editor to commit the code

  9. Switch back over to the design view using the Design toggle button top-right of the center pane

  10. Drag another "Button" instance and drop it on top of the toolbar in the device canvas

  11. Search for the "text" config and change the value from “MyButton1” to “Cancel”

  12. Search for the "iconCls" config and enter a value of “x-fa fa-close”

  13. In the config search input "event" and click the “+” next to View Controller Event Bindings and.

  14. Enter "tap" and click the Finish button.

  15. Click the "->" button on the “onButtonTap” item. Change the “fn” value from “onButtonTap” to “cancelUpdate”.

  16. In the Project Inspector pane double-click on the cancelUpdate item under the UpdateRecordFormViewController node. This will open up the code view for the cancelUpdate method. Enter the following code for the cancelUpdate method:

          var view = this.getView(),
              record = view.getRecord();
          view.destroy();
          record.reject();

  17. Click the "checkmark" button top-right of the code editor to commit the code

  18. Click Save

**Step 11: Show Form Panel from the Employee Grid**

Next, you’ll add the logic used to show the Update Record form when a grid row is clicked / tapped.

  1. In the Project Inspector pane click on Employee Directory (at Application > Views > Main > Employee Directory).

  2. In the config search input "event" and click the “+” next to View Controller Event Bindings and.

  3. Enter "itemtap" and click the Finish button.

  4. Click the "->" button on the “onGridItemTap” item. Change the “fn” value from “onGridItemTap” to “onPopupForm”.

  5. In the Project Inspector pane double-click on the onPopupForm item under the MyTabPanelViewController node. This will open up the code view for the onPopupForm method. Enter the following code for the cancelUpdate method:

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

   6. Click the "checkmark" button top-right of the code editor to commit the code

   7. Preview the app. Note that clicking / tapping a row of the grid will show the Update Record form panel.

**Step 12: Bind Data in Popup Form to Grid**

Finally, let’s set up the binding of the employee record to the form fields used to edit the record. The binding uses the viewModel configuration of the updaterecordform in the previous section. The record is associated to the view model data with a key of "employee". Each named field on the employee record will be used in the following steps when binding the value of the model’s field to that of the coordinating text field.

  1. Select the First Name text field in the Project Inspector pane at Application > Views > UpdateRecordForm > MyTextField.

  2. Search for the "bind" config and click the Edit button  Edit Config Button

  3. In the Code view enter the value of: '{employee.firstName}' and click the "checkmark" button top-right of the code editor to commit the value

  4. Select the Last Name text field (MyTextField1), search for the "bind" config, and set the value to: '{employee.lastName}'

  5. Select the Employee Location text field (MyTextField2), search for the "bind" config, and set the value to: '{employee.officeLocation}'

  6. Select the Phone Number text field (MyTextField3), search for the "bind" config, and set the value to: '{employee.phoneNumber}'

  7. Preview the app. When a grid row is clicked / tapped its record will be loaded to the popup form panel. Edits can now be made to the four field values with the Submit button committing the edit to the underlying record and Cancel discarding the edit.
