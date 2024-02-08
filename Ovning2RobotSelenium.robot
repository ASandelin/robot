
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
    When User navigates to the customerpage
    And User clicks the New Customer button
    Then The new customer form should be visible

BDD-Fill in new customer form
    [Documentation]    Fill in the new customer form
    [Tags]    Behavior driven test

    Given User opens the browser
    When User navigates to the customer page
    And User clicks the New Customer button
    And User fills in the new customer form
    Then The new customer should be successfully added

*** Keywords ***
User opens the browser
    Open Browser  ${url}  ${browser}
User navigates to the customerpage
    Go To  https://automationplayground.com/crm/customers.html?email-name=example%40gmail.com&password-name=efw&submit-name=
User clicks the New Customer button
    Click Element  //a[@id='new-customer']
The new customer form should be visible
    Wait Until Element Is Visible    xpath= //*[@id="loginform"]/div/div/div/div/h2   timeout=10
    Element Should Be Visible    xpath=//*[@id="loginform"]/div/div/div/div/h2

User fills in the new customer form
    Wait Until Element Is Visible    xpath = //*[@id="EmailAddress"]  timeout=10s
    Input Text    id = EmailAddress    bosse@mail.com
    Input Text    id = FirstName   bosse
    Input Text    id = LastName  svensson
    Input Text    id = City   miami
    Scroll Element Into View  id=StateOrRegion
    Select From List by Label  id=StateOrRegion  Florida
    Click Element  xpath=//input[@type='radio' and @value='male']
    Click Element  xpath=//input[@type='checkbox' and @name='promos-name' and @value='promos-yes']

The new customer should be successfully added
    Click Element  xpath=//button[@class='btn btn-primary']
    Wait Until Element Is Visible    xpath=//div[@id='Success' and contains(@class, 'alert-success')]
    Element Should Be Visible    xpath=//div[@id='Success' and contains(@class, 'alert-success')]
