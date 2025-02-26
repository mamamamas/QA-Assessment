*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Scenario2.robot
Suite Setup     Open Browsers
Suite Teardown  Close Browsers


*** Test Cases ***
Login Test
    Input Username    locked_out_user
    Input Pwd    secret_sauce
    Click Login
    Error should show
