*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem
Library    String        

*** Test Cases ***
TC1_Assignment1 
    Append To Environment Variable    path      ${EXECDIR}\\Drivers      
    Open Browser    url=https://www.medibuddy.in/    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    Title Should Be    Book Health Checks, Lab tests, Online Medicine & Doctor Consultation | MediBuddy
    #Click Link    //a[contains(text(),'My Account')]                
    Run Keyword And Ignore Error     Click Element     xpath://button[text()='Not Now']
    Click Element    xpath=//a[text()='Signup']
    Input Text    xpath=//input[@id="phone"]   9175917190
    Input Text    xpath=//input[@id='name']    Prasad
    Input Text    //input[@id='email']    prasaddiwane@gmail.com
    #Input Password    //input[@name='password']    password     
    #Click Element   //input[@type='checkbox']
    Click Element    //button[@type='submit']
    Close Browser
   
     
TC2_Assignment2 
    Append To Environment Variable    path    ${EXECDIR}\\Drivers          
    Open Browser    url=https://www.gotomeeting.com/en-in    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    Run Keyword And Ignore Error    Click Element    //button[text()='Accept Recommended Settings']       
    #Title Should Be    Online Meeting Software, Video Conferencing & Web Conferencing - Try Free | GoToMeeting
    Click Element    //a[text()='Try Free']                    
    #Click Element    xpath=(//a[text()='Start for Free'])[2]    
    Input Text    id=first-name    Prasad
    Input Text    id=last-name    Diwane
    Input Text    id=login__email    prasaddiwane1@gmail.com
    Input Text    id=contact-number    9175917190
    Select From List By Label    id=JobTitle    Engineering
    Input Text    id=login__password    password@1
    #Click Element    xpath=//input[@value='10-99']
    Sleep    2s    
    Select Radio Button    companySize   10 - 99
   # Click Element    //input[@value='10 - 99']    
    Click Element    //button[text()='Start My Trial'] 
    Title Should Be    Try GoToMeeting | Free 14 Day Trial    
    #Click Element    xpath=//button[text()='Sign Up']                
    Close Browser
    

TC3_Assignment3
    Append To Environment Variable    path    ${EXECDIR}\\Drivers  #.\\Driver\\chromedriver.exe        
    Open Browser    url=https://www.redbus.in/    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    
    Title Should Be    Book Bus Travels, AC Volvo Bus, rPool & Bus Hire - redBus India
    Click Element    id=signin-block
    Click Element    id=signInLink
    # Frame for mobile number    
    Select Frame     xpath=//*[@class='modalIframe']    
    Input Text       id=mobileNoInp    9175917190 
    Unselect Frame  
    Close Browser
    

TC4_Assignment4
    Append To Environment Variable    path     ${EXECDIR}\\Drivers        
    Open Browser    url=https://www.db4free.net/    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    
    Title Should Be    db4free.net - MySQL Database for free
    Click Element    xpath=//a[@href='/phpMyAdmin']
    
    #focus on phpMyAdmin tab
    Switch Window    phpMyAdmin
    #Enter user login details
    Input Text    xpath=//form[@id='login_form']//input[@id='input_username']    db123
    Input Text    id=input_password    test123    
    Click Element   xpath=//input[@type='submit']    
    #${message}      Get Text    xpath=//div[@class="alert alert-danger"]
    ${message}      Get Text     //body/div[@id='page_content']/div[@class='container']/div[@class='row']/div[@class='col-12']/div[2] 
    Log To Console    ${message}    
    Close Window    
    Switch Window    db4free.net - MySQL Database for free
    Click Element    xpath=//input[@name='submit']    
    Click Element    xpath=//button[@id='acceptAllButton']
    Input Text    xpath=//input[@name='donationAmount']       40
    Click Element    xpath=//button[@id='payWithGuest']    
    Input Text    xpath=//input[@name='cardNumber']   12345
    Execute Javascript    document.getElementById("expiry").value='06/24'
    Input Text    xpath=//input[@name='securityCode']   12345
    Input Text    xpath=//input[@name='firstName']   Prasad
    Input Text    xpath=//input[@name='lastName']   Diwane
    Input Text    xpath=//input[@name='line1']   LA
    Input Text    xpath=//input[@name='city']   Seattle
    Click Element    xpath=//button[@id='dropdownMenuButton_billing_state']  
    Click Element    xpath=//li[@data-value="Washington"]    
    Input Text    xpath=//input[@name='postcode']   1234
    Input Text    xpath=//input[@name='phone']   1234
    Input Text    xpath=//input[@name='email']   prasaddiwane@gmail.com
    Click Element    xpath=//button[@id='guestPaymentBtn']
        
    
        
TC5_Assignment5_1
    Append To Environment Variable    path    ${EXECDIR}\\Drivers        
    Open Browser    url=https://demo.openemr.io/b/openemr    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    Set Selenium Speed    1s
    Title Should Be    OpenEMR Login
    #Click Link    //a[contains(text(),'My Account')]                
    Click Element    id=authUser
    Input Text    id=authUser    admin    
    Click Element    id=clearPass
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice    English (Indian)    
    Click Element    xpath=//button[@type='submit']
    Title Should Be    OpenEMR
    Sleep    5s    
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']
    Select Frame    name=fin
    Click Element    id=create_patient_btn1
    Unselect Frame
    Select Frame    name=pat    
    Select From List By Label    id=form_title    Mr.
    Input Text    id=form_fname    Prasad
    Input Text    id=form_mname    S.
    Input Text    id=form_lname    Diwane
    ${now}    Evaluate    '{dt.year}-{dt.month}-{dt.day}'.format(dt=datetime.datetime.now())    modules=datetime
    Input Text    id=form_DOB      ${now}
    Select From List By Label    id=form_sex    Male
    Click Element    id=create
    Unselect Frame
    Select Frame    id=modalframe
    Wait Until Element Is Visible    xpath=//div[@id='searchResultsHeader']/center[1]/input[1]            
    Click Element    xpath=//div[@id='searchResultsHeader']/center[1]/input[1]
    Sleep    5s
    ${Alertmessage}    Handle Alert    
    Log To Console    ${Alertmessage}
    Run Keyword And Ignore Error     Click Element    xpath=//div[@class='closeDlgIframe']
    Unselect Frame
    ${patientName}    Get Text    xpath=//div[@id='attendantData']//span
    
    Log To Console    ${patientName}
    Close Browser
             

TC6_Assignment5_2
    Append To Environment Variable    path    ${EXECDIR}\\Drivers       
    Open Browser    url=https://www.royalcaribbean.com/    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds

   Run Keyword And Ignore Error    Click Element    xpath=//*[@class='email-capture__close']
   Click Element    id=rciHeaderSignIn
   Click Element    xpath=//a[text()='Create an account']
   Input Text       xpath=//*[@data-placeholder='First name/Given name']    Prasad    
   Input Text       xpath=//*[@data-placeholder='Last name/Surname']        Diwane
   Click Element    xpath=//*[text()='Month']    
   Sleep    2s    
   Click Element    xpath=//*[contains(text(),'June')]
   Click Element    xpath=//*[text()='Day']    
   Sleep    2s    
   Click Element    xpath=//span[contains(text(),' 3 ')]    
   Input Text       xpath=//*[@data-placeholder='Year']        1988
   Click Element    xpath=//*[text()='Country/Region of residence']    
   Click Element    xpath=//span[contains(text(),' India ')]
   Sleep    10s 
   Input Text       xpath=//input[@id='mat-input-2']    prasaddiwane@gmail.com
   Click Element    xpath=//*[@data-placeholder='Create new password']
   Input Text       xpath=//*[@data-placeholder='Create new password']        Password@1
   Click Element    xpath=//span[contains(text(),'Select one security question')]
   Click Element    xpath=//span[contains(text(),'What was the first concert you attended?')]
   Input Text       xpath=//*[@data-placeholder='Answer']        Sunburn
   Click Element    id=mat-checkbox-2    
   Click Element    xpath=//button[contains(text(),'Done')]

TC7_Assignment6_1
    Append To Environment Variable    path    ${EXECDIR}\\Drivers        
    Open Browser    url=https://demo.openemr.io/b/openemr    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    
    Title Should Be    OpenEMR Login
    #Click Link    //a[contains(text(),'My Account')]                
    Click Element    id=authUser
    Input Text    id=authUser    admin    
    Click Element    id=clearPass
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice    English (Indian)    
    Click Element    xpath=//button[@type='submit']
    Title Should Be    OpenEMR
    Sleep    5s    
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']
    Select Frame    name=fin
    Click Element    id=create_patient_btn1
    Unselect Frame
    Select Frame    name=pat    
    Select From List By Label    id=form_title    Mr.
    Input Text    id=form_fname    Prasad
    Input Text    id=form_mname    D.
    Input Text    id=form_lname    Diwane
    ${now}    Evaluate    '{dt.year}-{dt.month}-{dt.day}'.format(dt=datetime.datetime.now())    modules=datetime
    Input Text    id=form_DOB      ${now}
    Select From List By Label    id=form_sex    Male
    Sleep    2s    
    Click Element    id=create
    Sleep    2s    
    Unselect Frame
    Select Frame    id=modalframe
    Wait Until Element Is Visible    xpath=//div[@id='searchResultsHeader']/center[1]/input[1]            
    Click Element    xpath=//div[@id='searchResultsHeader']/center[1]/input[1]
    Sleep    5s
    Run Keyword And Ignore Error    Handle Alert        
    #Log To Console    ${Alertmessage}
    Sleep    5s    
    Click Element    xpath=//div[@class='closeDlgIframe']
    Unselect Frame
    #Select Frame    xpath=//div[@id='mainBox']/div[@id='mainFrames_div']/div[@id='framesDisplay']/div[2]/iframe[1]
    ${patientName}    Get Text    xpath=//div[@id='attendantData']//span
    #Unselect Frame
    #${patientName}    Remove String    ${patientName}    Medical Record Dashboard -        
    Log To Console    ${patientName}
    Close Browser   

TC8_Assignment6_2
    Append To Environment Variable    path    ${EXECDIR}\\Drivers        
    Open Browser    url=https://www.spicejet.com/Default.aspx    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    Set Selenium Speed    1sec
    Click Element    xpath=//a[text()='Book']    
    Click Element    xpath=//*[text()='Flights']    
    Click Element    xpath=//*[text()='Round Trip']
    Click Element    xpath=(//div[@id='marketCityPair_1']//input)[1]    
    Click Element    xpath=//a[normalize-space()='Delhi (DEL)']    
    #Click Element    xpath=(//div[@id='marketCityPair_1']//input)[2] 
    Sleep    2s                
    Click Element    (//a[@value='SAG'])[2]
   
    
TC9_Assignment6_3
    Append To Environment Variable    path    ${EXECDIR}\\Drivers       
    Open Browser    url=https://datatables.net/    browser=chrome  
    Maximize Browser Window
    Set Selenium Speed    1s
    
    Set Selenium Implicit Wait    30 seconds
    Select From List By Label    xpath=//div[@id='example_length']//select    50
    Log To Console    Names from Page 1    
    PrintNames1    #Names from page1
    Click Element    id=example_next
    Log To Console    Names from Page 2    
    PrintNames1    #Names from page2
    
TC9_Assignment6_4
    Append To Environment Variable    path    ${EXECDIR}\\Drivers        
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    Select From List By Label    xpath=//div[@id='example_length']//select    50
    Log To Console    Names from Page 1    
    PrintNames2    #Names from page1
    Click Element    id=example_next
    Log To Console    Names from Page 2    
    PrintNames2    #Names from page2
    
TC9_Assignment6_5
    Append To Environment Variable    path    ${EXECDIR}\\Drivers       
    Open Browser    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html    browser=chrome  
    Maximize Browser Window
    Set Selenium Implicit Wait    30 seconds
    Select From List By Label    xpath=//div[@id='example_length']//select    50
    ${Pcount}    Get Element Count    xpath=//*[@id='example_paginate']//span/a    
    FOR    ${PageCount}    IN RANGE    1    ${Pcount}+1
        GetNameCellValue    2
        Log To Console    ----------------------    
        Click Element    id=example_next    
    END
     
    
*** Keywords ***
PrintNames1
    ${ROWCOUNT}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    FOR    ${i}    IN RANGE    1    ${ROWCOUNT}+1
        ${AGE}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[4]
        #${AGE_FLAG}    Set Variable If    ${AGE} >= 50    true                            
        Run Keyword If   '${AGE}' >= '50'    GetSalary    ${i}                                    
    END
    
PrintNames2
    ${ROWCOUNT}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    
    FOR    ${i}    IN RANGE    1    ${ROWCOUNT}+1
        ${AGE}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[5]
        ${SALARY}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[6]  
        ${NAME}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[2]
        ${SALARY}    Remove String    ${SALARY}    $    ,
        #${AGE_FLAG}    Set Variable If    ${AGE} >= 50    true                            
        Run Keyword If   '${AGE}' >= '50' and '${SALARY}' >= '200000'    Log To Console    ${NAME}                           
    END
    
GetSalary
    [Arguments]    ${i}
    ${NAME}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[1]
    Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]    
    ${SALARY}    Get Text    //span[@class='dtr-data']
    ${SALARY}    Remove String    ${SALARY}    $    , 
    Run Keyword If    '${SALARY}' >= '200000'    Log To Console    ${NAME}
    Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1] 
    
GetNameCellValue    
    [Arguments]    ${cellvalue}
    ${ROWCOUNT}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    FOR    ${i}    IN RANGE    1    ${ROWCOUNT}+1
        ${NAME}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[${cellvalue}]
        Log To Console    ${NAME}                                        
    END   






      
