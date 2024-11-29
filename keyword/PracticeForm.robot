*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${file_path}    ${CURDIR}${/}cat.jpg

*** Keywords ***
When use practice form to DemoQA platform with ${practice_firstname}, ${practice_lastname}, ${practice_email}, ${practice_mobilenum}, ${practice_subjects}, ${practice_address}
    Scroll To Forms
    Click Forms
    Click Practice Form
    Input Firstname     ${practice_firstname}
    Input Lastname      ${practice_lastname}
    Input Email         ${practice_email}
    Select Gender  
    Input Mobile Number ${practice_mobilenum} 
    Select Date of Birth
    Input Subjects      ${practice_subjects}
    Select Hobbies
    Upload File
    Input Address       ${practice_address }
    Select State
    Select City 
    Submit Practice Form

Scroll To Forms
    Scroll Element Into View    xpath=//*[text()='Forms']
    Sleep    1

Click Forms
   Wait Until Page Contains Element 	 xpath=//*[text()='Forms']

Click Practice Form
    Wait Until Page Contains Element    xpath=//*[text()='Practice Form']

Input Firstname
    [Arguments]     ${practice_firstname}
    Input Text      id:firstName    ${practice_firstname}

Input Lastname
    [Arguments]     ${practice_lastname}
    Input Text      id:lastName     ${practice_lastname}

Input Email
    [Arguments]     ${practice_email}
    Input Text      id:uerEmail     ${practice_email}

Select Gender
    Click Element    xpath=//label[text()='Male']

Input Mobile Number 
    [Arguments]     ${practice_mobilenum} 
    Input Text    id:userNumber     ${practice_mobilenum}

Select Date of Birth
    Click Element    id:dateOfBirthInput
    Select From Dropdown    xpath=//select[@class='react-datepicker__month-select']    ${DATA.practice_month}
    Select From Dropdown    xpath=//select[@class='react-datepicker__year-select']    ${DATA.practice_year}
    Click Element          xpath=//div[contains(@class, 'react-datepicker__day') and not(contains(@class, 'outside-month')) and text()='${DATA.practice_date}']

Input Subjects     
    [Arguments]     ${practice_subjects}
    Input Text    id:subjectsInput    ${practice_subjects}
    Press Keys    id:subjectsInput    RETURN

Select Hobbies
    Click Element    xpath=//label[text()='Music']

Upload File
    Choose File    id:uploadPicture    ${file_path}

Input Address       
    [Arguments]     ${practice_address }
    Input Text    id:currentAddress     ${practice_address }

Select State
    Click Element    xpath=//div[text()='Select State']
    ${random_state}=    Get Text    xpath=(//div[@id='stateCity-wrapper']//div[@class='css-26l3qy-menu'])[1]//div[1]
    Click Element    xpath=//div[text()='${random_state}']

Select City 
     Click Element    xpath=//div[text()='Select City']
    ${random_city}=    Get Text    xpath=(//div[@id='stateCity-wrapper']//div[@class='css-26l3qy-menu'])[2]//div[1]
    Click Element    xpath=//div[text()='${random_city}']

Submit Practice Form
    Wait Until Element Is Visible 	 xpath=//button[text()='Submit']    2s
    Click Button        xpath=//button[text()='Submit']

Verify Thanks Page
    Wait Until Page Contains    ${PRACTICE_FORM_SUCCESS_MESSAGE}        2s
    Page Should Contain     ${PRACTICE_FORM_SUCCESS_MESSAGE}