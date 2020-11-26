*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}      https:\\www.google.com\
${Inputvalue}    cheese
*** Test Cases ***

GoogleSearchTest
   SmokeTestApp



*** Keywords ***
SmokeTestApp
    open browser     ${url}     ${browser}
    input text       name:q      ${Inputvalue}
    close browser
