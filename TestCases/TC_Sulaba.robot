*** Settings ***
Library  SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Budget Page
Test Template     Create Budget
Resource           ../Resources/resources.robot

*** Test Cases ***

SulabaIshaBudgetTest
    Open Browser To Login Page
    Set Selenium Timeout	15 seconds
    Go To Budget Page
    Create Budget
    Budget Approved from Finance Team
    Log To Console   "Budget created successfully"
    Close Browser


