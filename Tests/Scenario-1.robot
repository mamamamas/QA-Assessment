*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Scenario1.robot
Suite Setup     Open Browsers
Suite Teardown  Close Browsers


*** Test Cases ***
Login Test
    Input Username    standard_user
    Input Pwd    secret_sauce
    Click Login Button

Cart Test
    Click Item
    Click Cart
    Check Item

Info Test
    Add Info  Mark   Durana  4107

Test Checkout
    Click Continue Button
    Click Finish Button