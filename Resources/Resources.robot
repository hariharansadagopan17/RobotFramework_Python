*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}                            chrome
${url}                                https://purchase.sushumna.isha.in/web/login
${Inputvalue_username}                abarajith.sadagopan@ishafoundation.org
${Inputvalue_password}                123
${Inputvalue_BudgetName}              Test_Budget_Automation_123
${InputvalueReporting_Department}     Accommodations Residential
${InputvalueCompany}                  Isha Foundation
${Planned_Amount}                     25000
${budget_period_date_from}            02/10/2021
${budget_period_date_to}              02/28/2021
${ScreenShot_Directory}               C:\Users\aniru\PycharmProjects\RobotFramework_Python\Screenshots

*** Keywords ***
Capture page screenshot to loginscreen file
    Capture Page Screenshot  ${ScreenShot_Directory}/loginscreen-screenshot-1.png
Capture page screenshot to Budgetscreen file
    Capture Page Screenshot  ${ScreenShot_Directory}/Budgetscreen-screenshot-1.png
Capture page screenshot to Budgetscreen_Budget_line file
    Capture Page Screenshot  ${ScreenShot_Directory}/Budgetscreen_Add_line-screenshot-1.png
Capture page screenshot to Budgetscreen_Budget_line_Save file
    Capture Page Screenshot  ${ScreenShot_Directory}/Budgetscreen_Add_line_Save-screenshot-1.png
Capture page screenshot to Budgetscreen_Creation_Save file
    Capture Page Screenshot  ${ScreenShot_Directory}/Budgetscreen_Budget_Creation_Save-screenshot-1.png
Capture page screenshot to Budgetscreen_FinanceApproved file
    Capture Page Screenshot  ${ScreenShot_Directory}/Budgetscreen_Budget_Finance_Approved-screenshot-1.png

launchBrowser
 [Arguments]       ${appurl}     ${appbrowser}
 open browser      ${appurl}     ${appbrowser}
 maximize browser window

Open Browser To Login Page


    launchBrowser            ${url}               ${browser}
    ${username_locator}      set variable         name:login
    ${password_locator}      set variable         name:password
    ${submitButton_locator}  set variable         xpath://button[@type="submit"]
    input text               ${username_locator}  ${Inputvalue_username}
    input text               ${password_locator}  ${Inputvalue_password}
    Wait Until Element Is Visible                 ${submitButton_locator}
    click Element                                 ${submitButton_locator}
    Capture page screenshot to loginscreen file

Go To Budget Page
    ${MenubarButton_locator}          set variable                   xpath:/html/body/header/nav/ul[1]/li/a
    Wait Until Element Is Visible     ${MenubarButton_locator}
    click Element                     ${MenubarButton_locator}
    sleep   12
    ${BudgetDashboard_locator}        set variable                   xpath:/html/body/header/nav/ul[1]/li/div/a[17]
    click Element   ${BudgetDashboard_locator}
    sleep   12
    ${BudgetDashboard_icon_locator}   set variable                   xpath:/html/body/div[2]/div/div[1]/div/div[2]/div[1]/div/div/button[3]
    click Element   ${BudgetDashboard_icon_locator}
    sleep   12
    ${MultiCompany_Select_locator}    set variable                   xpath:/html/body/header/nav/ul[3]/li[3]/a
    click Element   ${MultiCompany_Select_locator}
    ${Budget_create_locator}          set variable                   xpath:/html/body/header/nav/ul[3]/li[3]/div/div[2]
    click Element   ${Budget_create_locator}
    sleep   12
    Capture page screenshot to Budgetscreen file

Add Budget Line
    ${Budget_AddLine_locator}                    set variable         xpath://a[text()="Add a line"]
    click Element   ${Budget_AddLine_locator}
    sleep   9
    Capture page screenshot to Budgetscreen_Budget_line file
    ${Budget_Position_locator}                   set variable          xpath://div[@name="general_budget_id"]
    click Element    ${Budget_Position_locator}
    ${Budget_Position_inputfield_locator}        set variable          xpath://div[@name="general_budget_id"]/div/input
    Mouse over       ${Budget_Position_inputfield_locator}
    ${Budget_Position_selecion_locator}         set variable           xpath:/html/body/ul[10]/li[1]/a
    Mouse down       ${Budget_Position_selection_locator}
    click Element    ${Budget_Position_selection_locator}
    ${Budget_Purposecode_locator}                set variable          xpath://div[@name="purpose_code"]
    click Element    ${Budget_Purposecode_locator}
    ${Budget_Purposecode_inputfiled_locator}     set variable          xpath://div[@name="purpose_code"]/div/input
    Mouse over       ${Budget_Purposecode_inputfiled_locator}
    ${Budget_Purposecode_selection_locator}      set variable          xpath:/html/body/ul[11]/li[3]/a
    Mouse down       ${Budget_Purposecode_selection_locator}
    click Element    ${Budget_Purposecode_selection_locator}
    ${Budget_Planned_amount_inputfield_locator}  set variable          xpath://div[@name="planned_amount"]/input
    input text       ${Budget_Planned_amount_inputfield_locator}       ${Planned_Amount}
    ${Budget_Name_inputfield_locator}            set variable          name:complete_name
    input text       ${Budget_Name_inputfield_locator}                 Test_Budget_Automation_123
    ${Budget_fromdate_picker_locator}            set variable          xpath://div[@id="datepicker83"]/input
    click Element    ${Budget_fromdate_picker_locator}
    input text       ${Budget_fromdate_picker_locator}                 ${budget_period_date_from}
    ${Budget_todate_picker_locator}              set variable          xpath://div[@id="datepicker84"]/input
    input text       ${Budget_todate_picker_locator}                   ${budget_period_date_to}
    ${Budget_saveandclose_button_locator}        set variable          xpath://span[contains(text(),"Save & Close")]
    click Element    ${Budget_saveandclose_button_locator}
    Capture page screenshot to Budgetscreen_Budget_line_Save file

Create Budget
    ${Budget_CustomName_inputfield_locator}             set variable          name:name
    input text      ${Budget_CustomName_inputfield_locator}                  ${Inputvalue_BudgetName}
    sleep   12
    ${Budget_requesting_department_locator}             set variable         name:requesting_department_id
    click Element   ${Budget_requesting_department_locator}
    ${Budget_requesting_department_inputfield_locator}  set variable         xpath://div[@name="requesting_department_id"]/div/input
    Mouse over      ${Budget_requesting_department_inputfield_locator}
    ${Budget_requesting_department_link_locator}        set variable         xpath:/html/body/ul[2]/li[2]/a
    Mouse down      ${Budget_requesting_department_link_locator}
    click Element   ${Budget_requesting_department_link_locator}
    sleep   12
    ${Budget_book_of_accounts_locator}                  set variable         xpath://div[@name="boa_id"]
    click Element   ${Budget_book_of_accounts_locator}
    ${Budget_book_of_accounts_input_field_locator}      set variable         xpath://div[@name="boa_id"]/div/input
    Mouse over      ${Budget_book_of_accounts_input_field_locator}
    ${Budget_book_of_accounts_link_locator}             set variable         xpath:/html/body/ul[8]/li[2]/a
    Mouse down      ${Budget_book_of_accounts_link_locator}
    click Element   ${Budget_book_of_accounts_link_locator}
    sleep   9
    ${Budget_budget_period_from_locator}                set variable         xpath://input[@name="date_from"]
    ${Budget_budget_period_to_locator}                  set variable         xpath://input[@name="date_to"]
    input text       ${Budget_budget_period_from_locator}                    ${budget_period_date_from}
    input text       ${Budget_budget_period_to_locator}                      ${budget_period_date_to}
    sleep   9
    Add Budget Line
    sleep   9
    Capture page screenshot to Budgetscreen_Creation_Save file

Budget Approved from Finance Team
    ${Budget_Approval_locator}                  set variable         xpath://button[contains(text(),"Finance Approved")]
    click element    ${Budget_Approval_locator}
    Capture page screenshot to Budgetscreen_FinanceApproved file

Close Browser
    close browser