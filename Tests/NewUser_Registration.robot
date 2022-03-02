*** Settings ***
Documentation  Smoke testing to validate the usage of robot framework as automation platform
...            test environment http://automationpractice.com/index.php
Resource       ../Resources/YourLoga_Automation.robot
Suite Setup    set log level  DEBUG
Test Setup     set selenium speed  0.01
Suite Teardown   Close All Browsers

*** Test Cases ***
New User Registers and activates Account
   [Tags]     Registration
   User on Application Homepage
   New User Account is created
   validate successful account creation
   new user can sign in

Existing user signs in with valid account credentials
  [Tags]     Sign in
  Enter valid username
  Enter valid password
  I click on the sign in button
  Assert successfull login

Customer search Products on Display
  [Tags]  Products search
  Search through Women Products
