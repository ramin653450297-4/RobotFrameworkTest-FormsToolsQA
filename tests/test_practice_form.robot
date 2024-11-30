*** Settings ***
Library         SeleniumLibrary
Resource        keyword/Homepage.robot
Resource        keyword/PracticeForm.robot
Variables       resources/config/config.yaml
Variables       resources/testdata/testdata.yaml
Suite Setup     Open Browser   ${baseUrl}      chrome
Suite Teardown  Close Browser

*** Test Cases ***
As a user, I want to practice form with valid data
    PracticeForm.When use practice form to DemoQA platform with ${practice_firstname}, ${practice_lastname}, ${practice_email}, ${practice_mobilenum}, ${practice_subjects}, ${practice_address}
    Then Practice form should display message as "Thanks for submitting the form" 


Test YAML Load
    Log    ${baseUrl}