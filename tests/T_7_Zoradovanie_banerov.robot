*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}                 https://fresh.fri.uniza.sk
${LOGIN URL}                ${BASE URL}/login

# Input data
${USERNAME}                 hrkut
${PASSWORD}                 fricka


# Locators
${USERNAME_FIELD}        xpath=//input[@type='text']
${PASSWORD_FIELD}        id=password
${LOGIN_BUTTON}          xpath=//button[@type='submit']
${FRI_LOGO}              xpath=//*[@id="app"]/div/div[1]/div[1]/a/img
${LOGOUT_BUTTON}         xpath=//*[@id="app"]/div/div[6]/div[2]/div/span/span/a/span/span
${CONTENT_BUTTON}        xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div/span/div
${BANERS_BUTTON}         xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div[2]/div/div[7]/div/a
${SAVE_BUTTON}           xpath=//*[@id="app"]/div/div[4]/div[2]/button/span
${SAVE_MESSAGE}          xpath=//div[contains(@class, 'ant-notification-notice-success')]
${AZ_BUTTON}             xpath=//*[@id="app"]/div/div[3]/div/div[2]/div[2]/button
${SOURCE_ELEMENT}        xpath=/html/body/div[1]/div/div[4]/div[1]/div/div/div/div[3]/div/div/div/div[1]/span[4]/span/img
${TARGET_ELEMENT}        xpath=/html/body/div[1]/div/div[4]/div[1]/div/div/div/div[3]/div/div/div/div[4]/span[4]/span/img

# Output data
${SAVE_MESSAGE_VALUE}    Úspešne uložené

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN URL}    Chrome
    Maximize Browser Window

Login As Admin
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}

Order Baners
    Wait Until Element Is Visible    ${CONTENT_BUTTON}    timeout=10s
    Click Element    ${CONTENT_BUTTON}
    Wait Until Element Is Visible    ${BANERS_BUTTON}    timeout=10s
    Click Element    ${BANERS_BUTTON}
    Wait Until Element Is Visible    ${AZ_BUTTON}    timeout=10s
    Click Button    ${AZ_BUTTON}
    Wait Until Element Is Visible    ${SOURCE_ELEMENT}    timeout=10s
    Drag And Drop    ${SOURCE_ELEMENT}    ${TARGET_ELEMENT}
    Click Element   ${SAVE_BUTTON}

Verify Success
    Wait Until Element Is Visible    ${SAVE_MESSAGE}    timeout=10s
    Wait Until Element Contains    ${SAVE_MESSAGE}    ${SAVE_MESSAGE_VALUE}    timeout=10s

Log Out
    Wait Until Element Is Visible    ${FRI_LOGO}    timeout=10s
    Click Element    ${FRI_LOGO}
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}


*** Test Cases ***
Verify Succesful Baner Order Edit
    [Documentation]    This test case should test baner edit  functionality on fresh.fri.uniza.sk
    [Tags]  baner edit

    [Setup]    Open Browser And Navigate To Login

    Login As Admin
    Order Baners
    Verify success
    Log Out

    [Teardown]    Close Browser