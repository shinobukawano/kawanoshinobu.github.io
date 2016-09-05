---
layout: post
title: "Sencha Architectチュートリアル「First Modern Application」日本語訳"
categories: [sencha, extjs]
css: jp-post
ogimage: modern-employee-directory-parts
---

<pre>
Sencha Architectのチュートリアル「<a href="http://docs.sencha.com/architect/4/guides/tutorials/first_mobile_application.html" target="_blank">First Modern Application</a>」の日本語訳です。
</pre>

これから「従業員一覧」アプリを作成します。本ガイドでは Sencha Architect 4.0 で Ext JS の Modern アプリケーションの開発する方法についての基礎知識を学習します。

<img src="/public/images/modern-employee-directory-parts.jpg" style="width:80%"/>

**ステップ 1: Architectの起動**

まず初めに、Architectをダウンロードします。その後、空のプロジェクトを作成します。

Download Architect from here

Start Architect on your computer and, if necessary, register or continue a trial subscription

In the initial Architect dialog click New Project

Choose your framework: Ext JS 6.0.x Modern at the top-right of the "New Project" window

Choose a project format: Click the Blank Project and click Create. This will create the empty application structure to which we’ll add our components and application logic to build our Employee Directory.

Step 2: Add Tab Panel and Save Project

The navigational framework of our app is created using a tab panel allowing us to navigate between an employee directory listing and a company information tab.

In the Toolbox panel on the right-hand side of Architect, search for "tab panel".
Drag the “Tab Panel” component from the Containers group on to the device canvas.

Click on the "Save" button in the toolbar top-left and click “Save” from the menu.

Provide a Save Path where the Architect application will be saved to.

Enter a Project Name. This will also be the directory for your app within the save path. Use "EmployeeDirectory" for the purpose of the walkthrough.

Type an App Name. This will be the namespace used within the application for all of its output class files. Input "EmpDir" for the purpose of the walkthrough.

Click Save

Note: Do not to save your project within another project directory (or other Cmd created workspace)
At the next prompt click No when asked " Would you like to scan your project for references to the old application name?"

To preview the app’s progress, click on the "Preview App" button  Preview Button to the right of the Save button and click the Preview button. Your default browser will open with a tab showing the app’s progress thus far (our tab panel we dragged to the device canvas).

Step 3: Update Tab Panel with Only 2 Tabs

In this section you will modify the tab panel’s default view to contain only the components you’ll need for your final app.

Select MyTabPanel from the Project Inspector pane

In the lower-right side of the Toolbox pane is the configs pane used to modify the configuration of views and other classes with your app. Search for "name" in the Filter Configs… field of the configs pane.

Change the value of the userClassName config from "MyTabPanel" to “Main”

Delete Tab 2 from the Main tab panel by right-clicking on Tab 2 under the Main component in the Project Inspector pane.

Next, delete Tab 3

Search for "grid" in the Toolbox pane

Drag an instance of the "Grid" component above Tab 1 in the Project Inspector pane to add the grid to the tab panel as the first tab (shown with the tab text of “New tab”)

Select New tab and in the configs pane search for "title". Update the title to “Employee Directory”

Alternatively, you can rename the tab by double-clicking the text of the tab in the device canvas of the main Design pane and entering the new text / title.
For the "Employee Directory" tab, input “iconCls” and click Add on the right-hand side of the filter field to add “iconCls” as a custom configuration. Set the value of “iconCls” to “x-fa fa-users”. This will add an icon to the tab using the Ext JS theme’s icon set.

Select Tab 2 in the Project Inspector pane. Update the title to "About Sencha"

For the "About Sencha" tab, add the custom “iconCls” config and set its value to “x-fa fa-info-circle”.

Preview the project to view your updates outside of Architect.

If you did not save before clicking the Preview button you will be prompted to save.
Step 4: Add "About Sencha" Panel in Tab 2

Here you’ll add the content and styling of the company information panel.

With the "About Sencha" tab selected in the Project Inspector pane, search for “html” in config panel. Change html to the following:

    <h1>About Sencha</h1><br/>More than 10,000 customers and 60% of the Fortune 100 rely on Sencha solutions to deliver innovative applications that drive their businesses. With a longstanding commitment to web technologies, Sencha dramatically reduces the cost and complexity of developing and delivering enterprise applications across multiple device types.<br/><br/><h2>Create feature-rich HTML5 applications using JavaScript</h2><br/>Sencha Ext JS is the most comprehensive MVC/MVVM JavaScript framework for building feature-rich, cross-platform web applications targeting desktops, tablets, and smartphones. Ext JS leverages HTML5 features on modern browsers while maintaining compatibility and functionality for legacy browsers.<br/><br/>Ext JS features hundreds of high-performance UI widgets that are meticulously designed to fit the needs of the simplest as well as the most complex web applications. Ext JS templates and layout manager give you full control over your display irrespective of devices and screen sizes. An advanced charting package allows you to visualize large quantities of data. The framework includes a robust data package that can consume data from any backend data source. Ext JS also offers several out-of-the-box themes, and complete theming support that lets you build applications that reflect your brand. It also includes an accessibility package (ARIA) to help with Section 508 compliance.

    
Add padding to our "About Sencha" tab by searching for “padding” and setting the “padding” config value to 10

Click on Save

Preview the app

Step 5: Add Model

Before stubbing in data for the employee directory you’ll first create a data model with fields describing the data set to be consumed by the grid / directory.

In the Project Inspector pane, click the "+" button and select Model from the drop down menu

Search for "name" in config panel and change the “userClassName” config from “MyModel” to “Employee”

From the config panel, search "fields".

Click the "+" button on the right-hand side of the fields config.

Enter "firstName, lastName, officeLocation, phoneNumber" and click Finish

Click Save

Step 6: Add Store

Next, you’ll add a data store to your project that will furnish data to the employee directory view. Architect will generate mock data allowing you to further visualize how your application will work once populated with employee data.

From the Project Inspector pane, click the "+" button and choose Store > Json Store from the drop down menu

Search for "name" in config panel and change the “userClassName” from “MyJsonStore” to “Employees”

Right click on the Employees store item in the Project Inspector pane and select Generate Mock Data

In the Generate Mock Data dialog window choose "Employee" for the Select Model field and click the Generate button

Note: When not generating mock data for your app you will want to associate your Employee model to your Employees store by filtering for "model" on the store config and selecting the “Employee” model from the “model” config’s drop down option.
Click Save

Step 7: Set Up the Employee Directory Grid

The employee directory grid has been added as a tab, but not yet configured to display the employee data from the Employees data store. In the following steps you will configure the presentation of the employee grid as well as associate each column to its corresponding field in the data store.

Select the Employee Directory grid item found in the Project Inspector pane found at Application > Views > Main > Employee Directory

Search for "columns" in the configs panel and delete all entries on the “Columns” config except for String by clicking on the “X” icon next to each entry

On the "Columns" config add two columns by clicking on the “+” button on the “Columns” config line and selecting “Column” from the drop down menu

In the config pane search for "store" and select “Employees” from the store config’s drop down option

Select the "String" column from the Project Inspector pane under the Employee Directory grid item

In the config pane search for "text" and change the value from “String” to “First Name”

Search for the "dataIndex" config and select “firstName” from the dataIndex config’s drop down option

Select "MyColumn2" from the Project Inspector pane

In the config panel search for "text" and change the value from “MyColumn2” to “Last Name”

Search for the "dataIndex" config and select “lastName” for the dataIndex config

Select "MyColumn3" from the Project Inspector pane

In the config panel search for "text" and change the value from “MyColumn3” to “Phone Number”

Search for the "dataIndex" config and select “phoneNumber” for the dataIndex config

For each column search for the "width" config and set the value to 120

Preview the app

Step 9: Add Form Panel

With the employee grid finished we’ll now create a form used to view and modify the details of an employee record.

In the Toolbox pane search for "form" and drag a “Form Panel” instance on to the Views node in the Project Inspector pane

Search for "name" in config panel and change “userClassName” from “MyFormPanel” to “UpdateRecordForm”

Search for "title" and change it from “My Form” to “Update Record”

Search for the "modal" and select (check) it

Search for "centered" and select it

Search for "text field" in the Toolbox pane

Drag a "Text Field" component on to the device canvas and drop it on the Update Record form panel. Do this three more times so that there is a total of four text fields on the “Update Record”.

Select the first text field (from either the design view or within the Project Inspector pane) and search for the "label" config. Change the label from “Field” to “First Name”. Do the same for each text field using the labels: First Name, Last Name, Office Location, and Phone Number.

Search for "toolbar" in the Toolbox pane and drag a Toolbar on to the Fom Panel

With the toolbar selected search for the "docked" config and set its value to “bottom” using the drop down

Click Save

Step 10: Add Buttons to Form Panel

Next, you’ll add buttons to the Update Record form that will either save edits back to the employee record or cancel the edit and close the form (we’ll save the binding of the record to the form itself for a later step).

Search for "button" in the Toolbox pane. Drag a “Button” instance and drop it on top of the toolbar in the device canvas.

Search for the "text" config and change the value from “MyButton” to “Submit”

Search for the "iconCls" config and enter a value of “x-fa fa-check”

In the config search input "event" and click the “+” next to View Controller Event Bindings and.

Enter "tap" and click the Finish button. This will add an “onButtonTap tap” item under View Controller Event Bindings where “onButtonTap” is the name of the method to execute when the button is tapped.

Click the "->" button on the “onButtonTap” item. Change the “fn” value from “onButtonTap” to “submitUpdate”. This will add the “submitUpdate” method to the “Update Form”s View Controller.

In the Project Inspector pane double-click on the submitUpdate item under the UpdateRecordFormViewController node. This will open up the code view for the submitUpdate method (note that the **Design view has now switched over to the Code** view in the main pane). Enter the following code for the submitUpdate method:

Sample Code
 var view = this.getView(),
     record = view.getRecord();
 view.destroy();
 record.commit();
Press the "checkmark" button top-right of the code editor to commit the code

Switch back over to the design view using the Design toggle button top-right of the center pane

Drag another "Button" instance and drop it on top of the toolbar in the device canvas

Search for the "text" config and change the value from “MyButton1” to “Cancel”

Search for the "iconCls" config and enter a value of “x-fa fa-close”

In the config search input "event" and click the “+” next to View Controller Event Bindings and.

Enter "tap" and click the Finish button.

Click the "->" button on the “onButtonTap” item. Change the “fn” value from “onButtonTap” to “cancelUpdate”.

In the Project Inspector pane double-click on the cancelUpdate item under the UpdateRecordFormViewController node. This will open up the code view for the cancelUpdate method. Enter the following code for the cancelUpdate method:

Sample Code
var view = this.getView(),
    record = view.getRecord();
view.destroy();
record.reject();
Click the "checkmark" button top-right of the code editor to commit the code

Click Save

Step 11: Show Form Panel from the Employee Grid

Next, you’ll add the logic used to show the Update Record form when a grid row is clicked / tapped.

In the Project Inspector pane click on Employee Directory (at Application > Views > Main > Employee Directory).

In the config search input "event" and click the “+” next to View Controller Event Bindings and.

Enter "itemtap" and click the Finish button.

Click the "->" button on the “onGridItemTap” item. Change the “fn” value from “onGridItemTap” to “onPopupForm”.

In the Project Inspector pane double-click on the onPopupForm item under the MyTabPanelViewController node. This will open up the code view for the onPopupForm method. Enter the following code for the cancelUpdate method:

Sample Code
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
Click the "checkmark" button top-right of the code editor to commit the code

Preview the app. Note that clicking / tapping a row of the grid will show the Update Record form panel.

Step 12: Bind Data in Popup Form to Grid

Finally, let’s set up the binding of the employee record to the form fields used to edit the record. The binding uses the viewModel configuration of the updaterecordform in the previous section. The record is associated to the view model data with a key of "employee". Each named field on the employee record will be used in the following steps when binding the value of the model’s field to that of the coordinating text field.

Select the First Name text field in the Project Inspector pane at Application > Views > UpdateRecordForm > MyTextField.

Search for the "bind" config and click the Edit button  Edit Config Button

In the Code view enter the value of: '{employee.firstName}' and click the "checkmark" button top-right of the code editor to commit the value

Select the Last Name text field (MyTextField1), search for the "bind" config, and set the value to: '{employee.lastName}'

Select the Employee Location text field (MyTextField2), search for the "bind" config, and set the value to: '{employee.officeLocation}'

Select the Phone Number text field (MyTextField3), search for the "bind" config, and set the value to: '{employee.phoneNumber}'

Preview the app. When a grid row is clicked / tapped its record will be loaded to the popup form panel. Edits can now be made to the four field values with the Submit button committing the edit to the underlying record and Cancel discarding the edit.
