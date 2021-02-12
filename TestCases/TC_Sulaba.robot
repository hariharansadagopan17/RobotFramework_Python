*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}       https://purchase.sushumna.isha.in/web/login
${Inputvalue_username}    abarajith.sadagopan@ishafoundation.org
${Inputvalue_password}    123
${Inputvalue_BudgetName}     Test_Budget_Automation_123
${InputvalueReporting_Department}   Accommodations Residential
${InputvalueCompany}                    Isha Foundation
${Planned_Amount}                       25000
${budget_period_date_from}      02/10/2021
${budget_period_date_to}        02/28/2021

*** Test Cases ***

SulabaIshaTest
   SmokeTestApp
   Capture page screenshot to loginscreen file



*** Keywords ***
Capture page screenshot to loginscreen file
    Capture Page Screenshot  ${OUTPUTDIR}/loginscreen-screenshot-1.png
SmokeTestApp
    open browser     ${url}     ${browser}
    maximize browser window
    input text       name:login      ${Inputvalue_username}
    input text       name:password    ${Inputvalue_password}
    Wait Until Element Is Visible   xpath://button[@type="submit"]
    click Element   xpath://button[@type="submit"]
    Capture page screenshot to loginscreen file
    #sleep   12
    Wait Until Element Is Visible  xpath:/html/body/header/nav/ul[1]/li/a
    click Element   xpath:/html/body/header/nav/ul[1]/li/a
    sleep   12
    click Element   xpath:/html/body/header/nav/ul[1]/li/div/a[17]
    sleep   12
    click Element   xpath:/html/body/div[2]/div/div[1]/div/div[2]/div[1]/div/div/button[3]
    sleep   12
    click Element   xpath:/html/body/header/nav/ul[3]/li[3]/a
    click Element   xpath:/html/body/header/nav/ul[3]/li[3]/div/div[2]
    sleep   12
    input text      name:name      ${Inputvalue_BudgetName}
    sleep   12
    click Element   name:requesting_department_id
    Mouse over      xpath://div[@name="requesting_department_id"]/div/input
    Mouse down      xpath:/html/body/ul[2]/li[2]/a
    click Element   xpath:/html/body/ul[2]/li[2]/a
    sleep   12
    click Element   xpath://div[@name="boa_id"]
    Mouse over      xpath://div[@name="boa_id"]/div/input
    Mouse down      xpath:/html/body/ul[8]/li[2]/a
    click Element   xpath:/html/body/ul[8]/li[2]/a
    sleep   9
    input text       xpath://input[@name="date_from"]     ${budget_period_date_from}
    input text       xpath://input[@name="date_to"]        ${budget_period_date_to}
    sleep   9
    click Element   xpath://a[text()="Add a line"]
    sleep   9
    click Element    xpath://div[@name="general_budget_id"]
    Mouse over       xpath://div[@name="general_budget_id"]/div/input
    Mouse down       xpath:/html/body/ul[10]/li[1]/a
    click Element    xpath:/html/body/ul[10]/li[1]/a
    click Element    xpath://div[@name="purpose_code"]
    Mouse over       xpath://div[@name="purpose_code"]/div/input
    Mouse down       xpath:/html/body/ul[11]/li[3]/a
    click Element    xpath:/html/body/ul[11]/li[3]/a
    input text       xpath://div[@name="planned_amount"]/input         ${Planned_Amount}
    input text       name:complete_name          Test_Budget_Automation_123
    click Element    xpath://div[@id="datepicker83"]/input
    input text       xpath://div[@id="datepicker83"]/input              ${budget_period_date_from}
    input text       xpath://div[@id="datepicker84"]/input              ${budget_period_date_to}
    click Element    xpath://span[contains(text(),"Save & Close")]
    sleep   9
    click Element    xpath://span[contains(text(),"Save")]
    sleep   9
    click element    xpath://button[contains(text(),"Finance Approved")]
    Log To Console   "Budget created successfully"

    close browser