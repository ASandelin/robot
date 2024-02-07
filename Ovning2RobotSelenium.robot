
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}   Chrome
${url}       automationplayground.com

*** Test Cases ***

Create new customer Test Case
    [Documentation]    Perform different scenarios based on input arguments
    [Tags]    DataDriven
    [Template]

Add new customer
