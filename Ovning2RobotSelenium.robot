
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}   Chrome
${url}       https://automationplayground.com/crm/

*** Test Cases ***
DDT- Test inlog
    [Documentation]    Perform login with different input arguments
    [Tags]    DataDriven
    [Template]    Run Test With Different Arguments
    testuser1@mail.com   pass1
    testuser2@mail.com   pass2

*** Keywords ***
Run Test With Different Arguments
    [Arguments]    ${username}     ${password}
    Open Browser    ${url}    ${browser}
    Click Element    //*[@id="SignIn"]
    Input Text    //*[@id="email-id"]    ${username}
    Input Text    //*[@id="password"]    ${password}
    Click Element    //*[@id="submit-id"]
    # Add more test steps as needed
    Wait Until Element Is Visible    xpath=/html/body/nav/ul/li/a    timeout=10
    Element Should Be Visible    xpath=//a[@class='nav-link' and @href='sign-out.html' and text()='Sign Out']
    Page Should Contain Element    xpath=/html/body/nav/ul/li/a
    Close Browser



