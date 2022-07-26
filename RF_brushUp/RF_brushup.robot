*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Library    Excel.Files
Resource   Resource/CommonFUnctionalities.resource  




Documentation    This POC is for Brushing up the RF skills and handson on different application
*** Variables ***
${name}    prasaddiwane@gmail.com
${url}    http://demowebshop.tricentis.com/
${browser}    chrome




*** Test Cases ***

TC_1_DemoWebShopLogin
    Append To Environment Variable    Path    D:\ChromeDriver    
    Log To Console    Sunny   
    ${Currentdate}    Get Current Date    
    Log To Console    ${Currentdate}
    Open Browser    url=http://demowebshop.tricentis.com/    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    
    #Click on Login button
    Click Element    //a[@class="ico-login"]
    
    #Input Username    
    Input Text    id=Email    ${name}
    
    #Input Password
    Input Password    id=Password    Prasad123
    
    #Submit Credentials
    Click Element    //input[@value="Log in"]   
    
    #Verify that User is login Successfully
    Element Should Be Visible    //a[@class="ico-logout"] 
    Element Text Should Be    //a[@href="/customer/info"]    ${name}    
    


TC2_DemoWebShopMultipleLogin
    Append To Environment Variable    Path    D:\ChromeDriver
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    
    #Username Details
    @{Username}	Create List	prasaddiwane@gmail.com	sunnydiwane@gmail.com	shrutidiwane@gmail.com
    ${NoOfUser}    Get Length    ${Username} 
    
    
    
    #Do Login
    FOR	${i}	IN RANGE	0	${NoOfUser}
    #Click on Login button
    Click Element    //a[@class="ico-login"]    
    Input Text    id=Email    ${Username}[${i}]
    
    #Input Password
    Input Password    id=Password    Prasad123
    
    #Submit Credentials
    Click Element    //input[@value="Log in"]   
    
    #Verify that User is login Successfully
    Element Should Be Visible    //a[@class="ico-logout"] 
    Element Text Should Be    //a[@href="/customer/info"]    ${Username}[${i}] 
    Wait Until Element Is Visible    //a[@class="ico-logout"]    
    Click Element    //a[@class="ico-logout"]    
    Sleep    3s    
    
    END
    Close Browser
    


TC3_Table
    Append To Environment Variable    Path    D:\ChromeDriver
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s 
    ${rowcount}    Get Element Count    //table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${rowcount}+1    
        
    ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[2] 
    Log To Console    ${name}
    Run Keyword If    '${name}'=='Brenden Wagner'    Click Element    //table[@id='example']/tbody/tr[${i}]/td[1]
    Exit For Loop If    '${name}'=='Brenden Wagner'            
    END
    

TC4_AUTOIT
    Append To Environment Variable    Path    D:\ChromeDriver
    Open Browser    url=https://demo.guru99.com/test/basic_auth.php    browser=${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Send    guru99
    sleep    1s
    Send    {ENTER}
    sleep    1s
    Send    guru99 
    sleep    1s
    Send    {ENTER}
    

TC5_AUTOIT_Naukari
    Launch Browser
    Click Element    //button[contains(text(),'Upload Resume')]
    Sleep    2s    
    Control Focus    Open    ${EMPTY}    Edit1
    Sleep    2s    
    Control Set Text    Open    ${EMPTY}    Edit1    D:\\421_Invoice_Prasad.pdf
    Sleep    2s    
    Control Click    Open    ${EMPTY}    Button1
    EndBrowser
    

TC6_Amazon
    Append To Environment Variable    Path    D:\ChromeDriver    
    Open Browser    url=https://www.amazon.in/Mrutyunjay-Hardbound-Deluxe-Shivaji-Sawant/dp/B07KFKH34V/ref=sr_1_1?crid=20L9I680PY1MB&keywords=Mrutyunjay+Hardbound+Deluxe+Royal+Edition+%28Marathi%29&qid=1658747183&sprefix=%2Caps%2C1536&sr=8-1    browser=chrome
    Maximize Browser Window
    Sleep    5s    
    Mouse Over    //span[@id='submit.add-to-cart']
    Click Element    //span[@id='submit.add-to-cart']    

    
            
         
   