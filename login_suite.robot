*** Settings ***

Library    AppiumLibrary    


*** Test Cases ***

TC1_VerificationCredential
       
    Open Application    http://localhost:4723/wd/hub
    ...    deviceName=Oneplus
    ...    platformName=Android
    ...    appPackage=com.myntra.android
    ...    appActivity=com.myntra.android.SplashActivity
    ...    noReset=True
    Set Appium Timeout    30s
    Wait Until Page Contains Element     //*[@text='Profile']          
    Click Element   //*[@text='Profile']
    Wait Until Page Contains Element         //*[@text='LOG IN/SIGN UP']   
    Click Element     //*[@text='LOG IN/SIGN UP']
    Wait Until Page Contains Element    //*[@content-desc='mobile']      
    Click Element    //*[@content-desc='mobile']   
    Input Text    //*[@content-desc='mobile']       6238143742
    ${keyboard}    Is Keyboard Shown
    Run Keyword If   '${keyboard}'=='True'     Hide Keyboard 
    # Wait Until Page Contains Element          //*[@text='CONTINUE']
       
    Click Element   //*[@text='CONTINUE']
    Wait Until Page Contains Element    //*[@text='GOOGLE']    
    Click Element    //*[@text='GOOGLE']
    Wait Until Page Contains Element        //*[@text='aminasr1998@gmail.com']	
    Click Element    //*[@text='aminasr1998@gmail.com']	
TC1_ValidationCredendial
    Open Application    http://localhost:4723/wd/hub
    ...    deviceName=Oneplus
    ...    platformName=Android
    ...    appPackage=com.myntra.android
    ...    appActivity=com.myntra.android.SplashActivity
    ...    noReset=True
    Set Appium Timeout    30s
    Wait Until Page Contains Element        //*[@content-desc='search']
    Click Element     //*[@content-desc='search']
    Wait Until Page Contains Element        //*[@text='Search for brands & products'] 
    Input Text    //*[@text='Search for brands & products']    VARANGA KURTA SETS
    Click Element     //*[@text='Varanga Kurta In Kurta Sets']
     Sleep    5s
     FOR    ${i}    IN RANGE    0    999    
       ${output}     Run Keyword And Ignore Error        Click Element     xpath=(//*[@content-desc='view_info_container'])[3]  
       Swipe By Percent    50   75    50    25 
       Exit For Loop If    '${output}[0]'=='PASS'
     END
     
     FOR    ${i}    IN RANGE    0    999    
       ${output}     Run Keyword And Ignore Error        Click Element      xpath=//*[@text='S']
       Swipe By Percent    50   75    50    25 
       Exit For Loop If    '${output}[0]'=='PASS'
     END
     
    FOR    ${i}    IN RANGE    0    999    
       ${output}     Run Keyword And Ignore Error         Click Element   xpath=//*[@text='ADD TO BAG']
       Exit For Loop If    '${output}[0]'=='PASS'
     END
     Wait Until Page Contains Element         xpath=//*[@text='GO TO BAG']
     Click Element   xpath=//*[@text='GO TO BAG']
     
     FOR    ${i}    IN RANGE    0    999    
       ${output}     Run Keyword And Ignore Error        Click Element   xpath=//*[@text='REMOVE'] 
       Swipe By Percent    50   75    50    25 
       Exit For Loop If    '${output}[0]'=='PASS'
     END
    Sleep    10s    
    
     FOR    ${i}    IN RANGE    0    999    
       Tap    //*    173    1849    1
       ${output}     Run Keyword And Ignore Error    Page Should Contain Text    it feels     
       Exit For Loop If    '${output}[0]'=='PASS'
     END
      
    Sleep    5s
    Close Application
    
    
    
    