*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Register Page

*** Test Cases ***
Register With Valid Username And Password
    Set Username  bubuland
    Set Password  bubuja123
    Set Confirmation Password  bubuja123
    Submit Registration Credentials
    Registration Should Succeed

Register With Too Short Username And Valid Password
    Set Username  bub
    Set Password  bubuja123
    Set Confirmation Password  bubuja123
    Submit Registration Credentials
    Register Should Fail With Message  Username must contain letters a-z, and be at least 3 characters long

Register With Valid Username And Too Short Password
    Set Username  bubuland
    Set Password  bubu22
    Set Confirmation Password  bubu22
    Submit Registration Credentials
    Registration Should Fail With Message  Password must contain both letters and numbers, minimum length is 8 characters

Register With Nonmatching Password And Password Confirmation
    Set Username  bubuland
    Set Password  bubuja123
    Set Confirmation Password  bubuja222
    Submit Registration Credentials
    Registration Should Fail With Message  Passwords don't match, try again!

Login After Successful Registration
    Set Username  bubuland
    Set Password  bubuja123
    Set Confirmation Password  bubuja123
    Submit Registration Credentials
    Go To Login Page
    Set Username  bubuland
    Set Password  bubuja123
    Submit Login Credentials
    Login Should Succeed

Login After Failed Registration
    Set Username  bubuland
    Set Password  bub
    Set Confirmation Password  bub
    Submit Registration Credentials
    Registration Should Fail With Message  Password must contain both letters and numbers, minimum length is 8 characters
    Go To Login Page
    Set Username  bubuland
    Set Password  bub
    Submit Login Credentials
    Login Should Fail With Message  Invalid username or password

*** Keywords ***
Submit Registration Credentials
    Click Button  Register

Submit Login Credentials
    Click Button  Login

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Text  password  ${password}

Set Confirmation Password
    [Arguments]  ${password_confirmation}
    Input Text  password_confirmation  ${password_confirmation}

Registration Should Fail With Message
    [Arguments]   ${message}
    Register Page Should Be Open
    Page Should Contain   ${message}

Registration Should Succeed
    Welcome Page Should Be Open

Login Should Succeed
    Main Page Should Be Open

Login Should Fail With Message
    [Arguments]   ${message}
    Login Page Should Be Open
    Page Should Contain   ${message}

Go To Register Page To Register
    Go To Register Page
    Register Page Should Be Open