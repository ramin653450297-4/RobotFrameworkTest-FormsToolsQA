*** Settings ***
Library SeleniumLibrary

*** Variables ***
${PRACTICE_FORM_SUCCESS_MESSAGE}    Thanks for submitting the form

*** Keywords ***
Open ToolsQA Homepage
    [Arguments]     ${url}
    Open Browser    ${url}      chrome
    Maximize Browser Window

Verify Practice Form Success
    Wait Until Page Contains ${PRACTICE_FORM_SUCCESS_MESSAGE}       2s
    Page Should Contain      ${PRACTICE_FORM_SUCCESS_MESSAGE}

