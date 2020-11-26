*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}      http://demoqa.com/automation-practice-form
${Inputvalue}   hariharansadagopan17@gmail.com
*** Test Cases ***

InputTextBoxTest
   SmokeTestApp



*** Keywords ***
SmokeTestApp
    open browser     ${url}     ${browser}
    maximize browser window
    title should be  ToolsQA
    click link       xpath://*[@id="app"]/div/div/div[2]/div[1]/div/div/div[2]/span/div
    click link       xpath://*[@id="item-0"]/span
    ${firstname_txt}    set variable    id:firstName
    ${Last_name_txt}    set variable    id:lastName
    element should be visible   ${firstname_txt}
    element should be enabled   ${firstname_txt}
    element should be visible   ${Last_name_txt}
    input text      ${firstname_txt}    ${Inputvalue}
    sleep  5
    clear element text  ${email_txt}
    sleep  5
    close browser