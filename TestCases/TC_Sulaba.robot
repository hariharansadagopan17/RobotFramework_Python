*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}       https://purchase.sushumna.isha.in/web/login
${Inputvalue_username}    abarajith.sadagopan@ishafoundation.org
${Inputvalue_password}    123
${Inputvalue_BudgetName}     TestBudgetAutomation
${InputvalueReporting_Department}       Accommodations Residential
${InputvalueCompany}                    Isha Foundation
${xpathToId}                            xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/table[1]/tbody/tr[3]/td[2]/div/div/input

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
    input text      xpath://input[@name="name"]      ${Inputvalue_BudgetName}
    sleep   8
    ${xpathToId}    set variable        xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/table[1]/tbody/tr[3]/td[2]/div/div/input
    Mouse over    ${xpathToId}
    click Element   xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[2]/table[1]/tbody/tr[3]/td[2]/div/button
    Mouse Down    xpath=//li[contains(.,'${InputvalueReporting_Department}')]
    Click Element  xpath=//li[contains(.,'${InputvalueReporting_Department}')]
    sleep   8

    close browser