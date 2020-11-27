*** Settings ***
Library  SeleniumLibrary
Library  DateTime
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
### This keyword evaluates the difference from current date and moves ahead/backward to select the month ###
Select Date  [Arguments]  ${year}  ${month}  ${date}


   ${currentDate} =     Get Current Date    result_format=datetime
   Convert To Integer  ${year}
   Convert To Integer  ${month}
   Convert To Integer  ${date}
   ${month-diff}=  Evaluate  ${month}-${currentDate.month}
   ${year-diff}=  Evaluate  ${year}-${currentDate.year}
   ${move}=  Evaluate  ${year-diff}*12+${month-diff}

   Wait Until Element Is Enabled  xpath=//*[@id="dateOfBirthInput"]
   Click Element  xpath=//*[@id="dateOfBirthInput"]

   ${shiftForward}=  Set Variable If
   ...   ${move}>0  1
   ...   ${move}<0  0

   ${move}=  Set Variable If
   ...   ${move}>0  ${move}
   ...   ${move}<0  ${move}*-1

   :FOR     ${var}  IN RANGE    ${move}
       \  Run Keyword If  ${shiftForward}==0  Click Element  css=#dateOfBirth > div.react-datepicker__tab-loop > div.react-datepicker-popper > div > div > button.react-datepicker__navigation.react-datepicker__navigation--previous
       \  Run Keyword If  ${shiftForward}==1  Click Element  css=#dateOfBirth > div.react-datepicker__tab-loop > div.react-datepicker-popper > div > div > button.react-datepicker__navigation.react-datepicker__navigation--previous

    Wait Until Element Is Enabled  xpath=//*[@id="dateOfBirthInput"]
    Click Element  xpath=//*[text()="${date}"]

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
    sleep  5
    Select Date  1989  7  17

    sleep  5

    sleep  5
    close browser