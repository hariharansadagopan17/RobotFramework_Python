*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}      http://demoqa.com/automation-practice-form
${Inputvalue1}   hariharan
${Inputvalue2}   sadagopan
${email_value}   hariharansadagopan17@gmail.com
${mobile_number_value}  9344961077
${date_of_birth}    17 Jul 1989
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
    ${gender_button}    set variable    //*[@id="genterWrapper"]/div[2]/div[1]/label
    ${mobilenumber_selector}   set variable    id:userNumber
    ${date_of_birth_value}      set variable    id:dateOfBirthInput
    element should be visible   ${firstname_txt}
    element should be visible   ${Last_name_txt}
    element should be visible   ${email_txt}
    input text      ${firstname_txt}    ${Inputvalue1}
    input text      ${Last_name_txt}    ${Inputvalue2}
    input text      ${email_txt}        ${email_value}

    sleep  5
    #select radio button    gender   Male
    click element    ${gender_button}
    input text      ${mobilenumber_selector}    ${mobile_number_value}
    clear element text  ${date_of_birth_value}
    sleep  5
    input text      ${date_of_birth_value}      ${date_of_birth}
    sleep  5

    sleep  5
    close browser