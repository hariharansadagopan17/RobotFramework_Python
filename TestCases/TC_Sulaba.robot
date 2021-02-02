*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}       https://purchase.sushumna.isha.in/web/login
${Inputvalue_username}    abarajith.sadagopan@ishafoundation.org
${Inputvalue_password}    123
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



    close browser