*** Settings ***
Resource    Resource/LoginPage.resource
Library    SeleniumLibrary  
Documentation    **This suite is implemented to Check Login Functionalities for Various User.**  
Test Setup    Launch Browser
Test Teardown    Close Browser        

*** Variables ***
${SeniorOfficer_Uname}    prasaddiwane@gmail.com
${JuniorOfficer_Uname}    sunnydiwane@gmail.com
${VerifyingOfficer_Uname}    shrutidiwane@gmail.com
${Password}    Prasad123

*** Test Cases ***

TC1_Login_On_DemoWebshop for Senior Officer
    
    Click on Login Button
    
    Enter Username and Password    ${SeniorOfficer_Uname}    ${Password}
    
    Do Login
    
    Verify that Login is Successful    ${SeniorOfficer_Uname}
    
    Do Logout
    

TC2_Login_On_DemoWebshop for Junior Officer
    
    Click on Login Button
    
    Enter Username and Password    ${JuniorOfficer_Uname}    ${Password}
    
    Do Login
    
    Verify that Login is Successful    ${JuniorOfficer_Uname}
    
    Do Logout
    


TC3_Login_On_DemoWebshop for Verifying Officer
    
    Click on Login Button
    
    Enter Username and Password    ${VerifyingOfficer_Uname}    ${Password}
    
    Do Login
    
    Verify that Login is Successful    ${VerifyingOfficer_Uname}
    
    Do Logout





