
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}   Chrome
${url}       automationplayground.com

*** Test Cases ***
Data-Driven Test Case
    [Documentation]    Perform different scenarios based on input arguments
    [Tags]    DataDriven
    [Template]    Run Test With Different Arguments
    Login    testuser1   pass1
    Login    testuser2   pass2

*** Keywords ***
Run Test With Different Arguments
    [Arguments]    ${username}     ${password}
    Open Browser    ${url}    ${browser}
    Input Text    //input[@id='username']    ${username}
    Input Text    //input[@id='password']    ${password}
    Click Button    //button[@id='loginBtn']
    # Add more test steps as needed
    Close Browser

Login
    [Arguments]    ${username}    ${password}
    Run Keyword   Run Test With Different Arguments ${username}   ${password}

