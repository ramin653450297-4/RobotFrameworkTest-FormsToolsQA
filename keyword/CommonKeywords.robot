*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Wait until element is ready then click element
    [Arguments]     ${locator}
    Wait Until Keyword Succeeds     5x      2s       Click Element      ${locator}


Wait until element is ready then input text
    [Arguments]     ${locator}      ${text}
    Wait Until Keyword Succeeds     5x      2s      Input Text      ${locator}      ${text}