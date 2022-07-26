*** Settings ***

Library    DateTime   
Library    SeleniumLibrary     
Library    OperatingSystem  
Library    AutoItLibrary 
Resource   Resource/CommonFunctionalities_PieChart.resource

Documentation    TC2_This Testcases is to verify the content of Piechart.

...    
Test Setup    Launch Browser
Test Teardown    EndBrowser



*** Test Cases ***

TC_2_PieChart_Validation
    Log    message    
    Verify_VioletPartValues
    Verify_GreenPartValues
    Verify_GreyPartValues

