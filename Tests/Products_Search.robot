*** Settings ***
Documentation  Smoke testing to validate the usage of robot framework as automation platform
...            test environment http://automationpractice.com/index.php
Resource       ../Resources/YourLoga_Automation.robot
Suite Setup    set log level  DEBUG
Test Setup     set selenium speed  0.01
Suite Teardown   Close All Browsers



*** Test Cases ***
Customer search Products on Display
  [Tags]  Product Search
  Search through Women Products