*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}      http://demoqa.com/automation-practice-form
${Inputvalue1}   hariharan
${Inputvalue2}   sadagopan
${email_value}   hariharansadagopan17@gmail.com
*** Test Cases ***

InputTextBoxTest
   SmokeTestApp



*** Keywords ***
SmokeTestApp
    open browser     ${url}     ${browser}
    maximize browser window
    ${firstname_txt}    set variable    id:firstName
    ${Last_name_txt}    set variable    id:lastName
    ${email_txt}        set variable    id:userEmail
    element should be visible   ${firstname_txt}
    element should be visible   ${Last_name_txt}
    element should be visible   ${email_txt}
    input text      ${firstname_txt}    ${Inputvalue1}
    input text      ${Last_name_txt}    ${Inputvalue2}
    input text      ${email_txt}        ${email_value}
    sleep  5
    select radio button    gender   Male
    sleep  5
    clear element text  ${email_txt}
    sleep  5
    close browser