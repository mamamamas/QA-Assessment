*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome

*** Keywords ***
Open Browsers
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10 seconds

Close Browsers
    Close All Browsers

Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}

Input Pwd
    [Arguments]    ${password}
    Input Password    id=password    ${password}
    
Click Login
    Click Button    xpath://*[@id="login-button"]
    
Error should show
    ${message}=    Get Text     //*[@id="login_button_container"]/div/form/div[3]/h3
     IF    '${message}' == 'Epic sadface: Sorry, this user has been locked out.'
        Log To Console    Pass
    ELSE
        Fail
    END

    