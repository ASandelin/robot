
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}   Chrome
${url}       https://automationplayground.com/crm/

*** Test Cases ***
BDD-Create new customer 
    [Documentation]    Perform different scenarios based on input arguments
    [Tags]    Behavior driven test

    Given User opens the browser

Add new customer
