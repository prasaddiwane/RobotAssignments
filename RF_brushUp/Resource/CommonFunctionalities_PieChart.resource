*** Settings ***
Library    AutoItLibrary    
Library    SeleniumLibrary    
Library    DateTime    
Library    OperatingSystem
Library    String    


*** Variables ***

${name}    prasaddiwane@gmail.com
${url}    http://demowebshop.tricentis.com/
${browser}    chrome 

${Violet_Xpath}    //*[contains(@class,'yui3-svgSvgPieSlice')][@fill='#66007f']        
${GreenXpath}    //*[contains(@class,'yui3-svgSvgPieSlice')][@fill='#295454']
${GreyXpath}    //*[contains(@class,'yui3-svgSvgPieSlice')][@fill='#e8cdb7']
${LightVioletXpath}    //*[contains(@class,'yui3-svgSvgPieSlice')][@fill='#996ab2']
${BrownXpath}    //*[contains(@class,'yui3-svgSvgPieSlice')][@fill='#a86f41']
${ToolTipXpath}    //div[contains(@id,'_tooltip')]




*** Keywords ***

Launch Browser
    
    Append To Environment Variable    Path    ${EXECDIR}${/}Drivers
    Open Browser    url=https://clarle.github.io/yui3/yui/docs/charts/charts-pie.html    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    

EndBrowser
    
    Close Browser
    

Verify_VioletPartValues
    
    Click Element    ${Violet_Xpath}
    sleep    1s
    ${VioletPartValue}    Get Text    ${ToolTipXpath}
    Log    ${VioletPartValue}  
    @{VioletList}    Split String    ${VioletPartValue} 
    Log    ${VioletList}[1] 
    
Verify_GreenPartValues  
    
    Click Element    ${GreenXpath}    
    sleep    1s
    ${GreenPartValue}    Get Text    ${ToolTipXpath}
    Log    ${GreenPartValue}  
    @{GreenList}    Split String    ${GreenPartValue} 
    Log    ${GreenList}[1]      
    
Verify_GreyPartValues     
    
    Click Element    ${GreyXpath}    
    sleep    1s
    ${GreyPartValue}    Get Text    ${ToolTipXpath}
    Log    ${GreyPartValue}  
    @{GreyList}    Split String    ${GreyPartValue} 
    Log    ${GreyList}[1] 
    
    



















