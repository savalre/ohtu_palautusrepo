*** Settings ***
Resource  resource.robot
Test Setup  Input New Command And Create User

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  kissala  kissa234
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  koironakki332
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  bu  bubula2323
    Output Should Contain  Username must contain letters a-z, and be at least 3 characters long

Register With Valid Username And Too Short Password
    Input Credentials  bubuland  pupu2
    Output Should Contain  Password must contain both letters and numbers, minimum length is 8 characters

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  bubulandia pupukissa
    Output Should Contain  Password must contain both letters and numbers, minimum length is 8 characters

*** Keywords ***
Input New Command And Create User
    Input New Command
    Create User  kalle  kalle123