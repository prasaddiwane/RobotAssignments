*** Settings ***
Library    AutoItLibrary    
Library    SeleniumLibrary    
Library    DateTime    
Library    OperatingSystem   

*** Variables ***
${name}    prasaddiwane@gmail.com
${url}    http://demowebshop.tricentis.com/
${browser}    chrome 



*** Keywords ***

Launch Browser
    Append To Environment Variable    Path    ${EXECDIR}${/}Drivers
    Open Browser    url=https://www.naukri.com/registration/createAccount?othersrcp=22636    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    

EndBrowser
    Close All Browsers