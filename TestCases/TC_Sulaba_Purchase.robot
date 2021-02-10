*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}     chrome
${url}       https://purchase.sushumna.isha.in/web/login
${Inputvalue_username}    abarajith.sadagopan@ishafoundation.org
${Inputvalue_password}    123
${InputvalueReporting_Department}   Accommodations Residential
${InputvalueCompany}                 Isha Foundation
${budget_period_date_from}      02/04/2021
${budget_period_date_to}        02/28/2021

*** Test Cases ***

SulabaIshaTest
    PurchaseTestApp

*** Keywords ***
PurchaseTestApp
    open browser     ${url}     ${browser}
    maximize browser window
    ${username_locator}                        set variable     name:login
    ${password_locator}                        set variable     name:password
    ${signinbutton_locator}                    set variable     xpath://*[@id="wrapwrap"]/main/div/div[1]/div/div/div/div/form/div[4]/button
    ${dropdownmenu_locator}                    set variable     xpath:/html/body/header/nav/ul[1]/li/a
    ${PurchaseRequest_locator}                 set variable     xpath:/html/body/header/nav/ul[1]/li/div/a[15]
    ${PurchaseRequest_link_locator}            set variable     xpath:/html/body/header/nav/ul[2]/li[3]/a
    ${PurchaseRequest_Dropdown_locator}        set variable     xpath:/html/body/header/nav/ul[2]/li[3]/div/a[1]
    ${Create_locator}                          set variable     xpath:/html/body/div[2]/div/div[1]/div/div[2]/div[1]/div/div/button[3]
    ${companydropdown_locator}                 set variable     xpath:/html/body/header/nav/ul[3]/li[3]/a
    ${companydropdownlink_locator}             set variable     xpath:/html/body/header/nav/ul[3]/li[3]/div/div[2]/div[1]/span/i
    ${selectcompany_locator}                   set variable     name:company_id
    ${RequestingCompanyDropbox_locator}        set variable     name:requesting_department_id
    ${RequestingCompanyDropbox_Modal_locator}  set variable     xpath://div[@name="requesting_department_id"]/div/input
    ${RequestingCompanyDropbox_Link_locator}   set variable     xpath:/html/body/ul[1]/li/a
    ${Purchase_Budget_locator}                 set variable     name:budget_line_id
    ${Purchase_Budget_Modal_locator}           set variable     xpath://div[@name="budget_line_id"]/div/input
    ${Purchase_Budget_search_Link_locator}     set variable     xpath:/html/body/ul[5]/li[8]/a
    ${Purchase_Budget_Search_Budget_Modal}     set variable     xpath://div[@class="modal o_technical_modal show"]
    ${Purchase_Budget_Search_Box_locator}      set variable     xpath://div[@class="o_searchview_input_container"]/input
    ${Purchase_BookofAccounts_locator}         set variable     xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[3]/table[1]/tbody/tr[10]/td[2]/div/div/input
    ${Purchase_BookofAccounts_Modal_locator}   set variable     xpath:/html/body/ul[6]
    ${Purchase_BookofAccounts_Link_locator}    set variable     xpath:/html/body/ul[6]/li/a
    ${Purchase_BookofAccounts_Link_locator}    set variable     xpath:/html/body/ul[6]/li/a
    input text       ${username_locator}      ${Inputvalue_username}
    input text       ${password_locator}      ${Inputvalue_password}
    click Element    ${signinbutton_locator}
    sleep   8
    click Element    ${dropdownmenu_locator}
    sleep   8
    click Element    ${PurchaseRequest_locator}
    sleep   8
    click Element    ${PurchaseRequest_link_locator}
    sleep  8
    Mouse over       ${PurchaseRequest_Dropdown_locator}
    click Element    ${PurchaseRequest_Dropdown_locator}
    sleep  8
    click Element    ${Create_locator}
    sleep  8
    click Element    ${companydropdown_locator}
    Mouse down       ${companydropdownlink_locator}
    click Element    ${companydropdownlink_locator}
    sleep  8
    select from list by label   ${selectcompany_locator}        ${InputvalueCompany}
    sleep  8
    click Element   ${RequestingCompanyDropbox_locator}
    Mouse over      ${RequestingCompanyDropbox_Modal_locator}
    Mouse down      ${RequestingCompanyDropbox_Link_locator}
    click Element   ${RequestingCompanyDropbox_Link_locator}
    sleep   8
    click Element   ${Purchase_Budget_locator}
    Mouse over      ${Purchase_Budget_Modal_locator}
    Mouse down      ${Purchase_Budget_search_Link_locator}
    click Element   ${Purchase_Budget_search_Link_locator}
    Wait Until Element Is Visible   ${Purchase_Budget_Search_Budget_Modal}
    input text ${Purchase_Budget_Search_Box_locator}
    Press Keys button RETURN

    sleep   8

    sleep   8

    close browser