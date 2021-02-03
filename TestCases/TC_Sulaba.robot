*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}       https://purchase.sushumna.isha.in/web/login
${Inputvalue_username}    abarajith.sadagopan@ishafoundation.org
${Inputvalue_password}    123
${Inputvalue_BudgetName}     TestBudgetAutomation
${InputvalueReporting_Department}   Accommodations Residential
${InputvalueCompany}                    Isha Foundation
${budget_period_date_from}      02/04/2021
${budget_period_date_to}        02/28/2021

*** Test Cases ***

SulabaIshaTest
   SmokeTestApp



*** Keywords ***
SmokeTestApp
    open browser     ${url}     ${browser}
    maximize browser window
    input text       name:login      ${Inputvalue_username}
    input text       name:password    ${Inputvalue_password}
    click Element    xpath://*[@id="wrapwrap"]/main/div/div[1]/div/div/div/div/form/div[4]/button
    sleep   8
    click Element   xpath:/html/body/header/nav/ul[1]/li/a
    sleep   8
    click Element   xpath:/html/body/header/nav/ul[1]/li/div/a[17]
    sleep   8
    click Element   xpath:/html/body/div[2]/div/div[1]/div/div[2]/div[1]/div/div/button[3]
    sleep   8
    click Element   xpath:/html/body/header/nav/ul[3]/li[3]/a
    click Element   xpath:/html/body/header/nav/ul[3]/li[3]/div/div[2]
    sleep   8
    input text      xpath://input[@name="name"]      ${Inputvalue_BudgetName}
    sleep   8
    click Element   xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/table[1]/tbody/tr[3]/td[2]/div/div/input
    Mouse over      xpath:/html/body/ul[2]
    Mouse down      xpath:/html/body/ul[2]/li[2]/a
    click Element   xpath:/html/body/ul[2]/li[2]/a
    sleep   8
    click Element   xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/table[1]/tbody/tr[4]/td[2]/div/div/div/input
    Mouse over      xpath:/html/body/ul[8]
    Mouse down      xpath:/html/body/ul[8]
    click Element   xpath:/html/body/ul[8]/li[2]/a
    sleep   5
    input text       xpath://input[@name="date_from"]     ${budget_period_date_from}
    input text       xpath://input[@name="date_to"]        ${budget_period_date_to}
    sleep   5
    click Element   xpath://a[text()="Add a line"]
    sleep   5
    click Element   xpath:/html/body/div[17]/div/div/main/div/div/div/div[1]/table[1]/tbody/tr[1]/td[2]/div/div/input
    Mouse over      xpath:/html/body/ul[10]
    Mouse down      xpath:/html/body/ul[10]
    click Element   xpath:/html/body/ul[10]/li[8]/a
    ${budget_position_search}   set variable    xpath:/html/body/div[19]/div/div/main/div/div[1]/div/div[1]/div/div/div/input
    input text  ${budget_position_search}   test
    Mouse over      xpath:/html/body/div[19]/div/div/main/div/div[1]/div/div[1]/div/div/div[2]/div
    click Element   xpath:/html/body/div[19]/div/div/main/div/div[1]/div/div[1]/div/div/div[2]/div
    sleep   5
    click Element   xpath:/html/body/div[19]/div/div/main/div/div[2]/div/div/table/tbody/tr[1]/td[1]
    sleep   5
    ${budget_Planned_Amount}    set variable    xpath:/html/body/div[17]/div/div/main/div/div/div/div[1]/table[1]/tbody/tr[3]/td[2]/div/input
    input text  ${budget_Planned_Amount}    15000
    input text       name:complete_name      Test_Budget_Automation
    input text       name:date_from      ${budget_period_date_from}
    input text       name:date_to        ${budget_period_date_to}
    click Element    xpath:/html/body/div[17]/div/div/footer/button[1]
    sleep   5
    click Element   xpath:/html/body/div[2]/div/div[1]/div/div[2]/div[1]/div/div/div[2]/button[1]




    close browser