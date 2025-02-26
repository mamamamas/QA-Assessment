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

Click Login Button
    Click Element    xpath=//*[@id="login-button"]

Click Item
    Click Button    xpath://*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Button    xpath://*[@id="add-to-cart-sauce-labs-fleece-jacket"]

Click Cart
    Click Link    xpath://*[@id="shopping_cart_container"]/a

Check Item
    Click Button    xpath://*[@id="checkout"]

Add Info
    [Arguments]     ${Firstname}    ${Lastname}     ${Zipcode}
    Input Text    id=first-name    ${Firstname}
    Input Text    id=last-name     ${Lastname} 
    Input Text    id=postal-code    ${Zipcode}

Click Continue Button
    Click Element    //*[@id="continue"]

Click Finish Button
    Click Button    //*[@id="finish"]
    ${message}=    Get Text    //*[@id="checkout_complete_container"]/h2

    IF    '${message}' == 'Thank you for your order!'
        Log To Console    Done!
    ELSE
         Fail
    END


