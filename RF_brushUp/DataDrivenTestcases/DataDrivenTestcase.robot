*** Settings ***
Resource    ../Resource/LoginPage.resource
Library    SeleniumLibrary  
Documentation    **This suite is implemented to Check Login Functionalities using Template only.**  
...    
Test Setup    Launch Browser
Test Teardown    Close Browser 

Test Template    Verify_Valid_Credentials_Template

*** Variables ***

*** Test Cases ***

TC1_LoginFunctionalities    prasaddiwane@gmail.com    Prasad123
    
TC2_LoginFunctionalities    sunnydiwane@gmail.com    Prasad123
    
TC3_LoginFunctionalities    shrutidiwane@gmail.com    Prasad123
    


    
*** Keywords ***

Verify_Valid_Credentials_Template
    [Arguments]    ${username}    ${password}
    
    Click on Login Button
    
    Enter Username and Password    ${username}    ${password}
    
    Do Login
    
    Verify that Login is Successful    ${username}
    
    Do Logout
    
     
