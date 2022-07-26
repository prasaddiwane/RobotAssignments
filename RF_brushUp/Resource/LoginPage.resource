*** Settings ***
Library    AutoItLibrary    
Library    SeleniumLibrary    
Library    DateTime    
Library    OperatingSystem
Library    String  


*** Variables ***

${url}    http://demowebshop.tricentis.com/
${browser}    chrome 
${LoginXpath}    //a[@class="ico-login"]
${LoginButtonXPath}    //input[contains(@class,'login-button')]
${LogoutXpath}    //a[@class="ico-logout"]
${UsernamePath}    id=Email
${PasswordPath}    id=Password
${UsernameInfoXpath}    (//a[@href="/customer/info"])[1]




*** Keywords ***

Launch Browser
    
    Append To Environment Variable    Path    ${EXECDIR}${/}Drivers
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    
Click on Login Button
    
    Click Element    ${LoginXpath}  
    

Enter Username and Password
    [Arguments]    ${username}    ${password}
    #Input Username    
    Input Text    ${UsernamePath}    ${username}
    
    #Input Password
    Input Password    ${PasswordPath}    ${password}  
    
Do Login
    Click Element    ${LoginButtonXPath}
    Sleep    2s    
    

Verify that Login is Successful
    [Arguments]    ${username}
     #Verify that User is login Successfully
    Element Should Be Visible    ${LogoutXpath} 
    Sleep    2s    
    Element Text Should Be    ${UsernameInfoXpath}    ${username} 
    
Do Logout
    Click Element    ${LogoutXpath}
    Sleep    2s    
    
    
    
    
    

    