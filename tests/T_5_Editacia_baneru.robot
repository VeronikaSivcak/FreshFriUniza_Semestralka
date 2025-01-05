*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}                 https://fresh.fri.uniza.sk
${LOGIN URL}                ${BASE URL}/login

# Input data
${USERNAME}                 hrkut
${PASSWORD}                 fricka
${DESCRIPTION}              hello
${LINK_URL}                 https://www.google.sk/?hl=sk


# Locators
${USERNAME_FIELD}        xpath=//input[@type='text']
${PASSWORD_FIELD}        id=password
${LOGIN_BUTTON}          xpath=//button[@type='submit']
${FRI_LOGO}              xpath=//*[@id="app"]/div/div[1]/div[1]/a/img
${LOGOUT_BUTTON}         xpath=//*[@id="app"]/div/div[6]/div[2]/div/span/span/a/span/span
${CONTENT_BUTTON}        xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div/span/div
${BANERS_BUTTON}         xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div[2]/div/div[7]/div/a
${PENCIL_BUTTON}         xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/tbody/tr[1]/td[6]/div/div[1]/button
${DESCRIPTION_FIELD}     xpath=//*[@id="meta_name"]
${URL_FIELD}             xpath=//*[@id="target_url"]
${SAVE_BUTTON}           xpath=//*[@id="app"]/div/div[4]/form/div[2]/div/div/div/div/div/button/span
${SAVE_MESSAGE}          xpath=//div[contains(@class, 'ant-notification-notice-success')]
${EMPTY_FIELD_MESSAGE1}  xpath=//*[@id="target_url_help"]/div
${EMPTY_FIELD_MESSAGE2}  xpath=//*[@id="meta_name_help"]/div
${DISPLAY_BANNER_ON_OF}  xpath = //*[@id="active"]/div


# Output data
${EMPTY_FIELD_MESSAGE_VALUE}    Pole je povinné
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

Find Baner To Edit
    Wait Until Element Is Visible    ${CONTENT_BUTTON}    timeout=10s
    Click Element    ${CONTENT_BUTTON}
    Wait Until Element Is Visible    ${BANERS_BUTTON}    timeout=10s
    Click Element    ${BANERS_BUTTON}
    Wait Until Element Is Visible    ${PENCIL_BUTTON}    timeout=10s
    Click Button    ${PENCIL_BUTTON}


Edit And Save Baner
    Wait Until Element Is Visible    ${URL_FIELD}    timeout=10s
    Click Element    ${URL_FIELD}
    FOR    ${i}    IN RANGE    0   40
        Press Keys    ${URL_FIELD}    BACKSPACE
    END

    Click Element    ${DESCRIPTION_FIELD}
    FOR    ${i}    IN RANGE    0   30
        Press Keys    ${DESCRIPTION_FIELD}    BACKSPACE
    END

    Wait Until Element Contains    ${EMPTY_FIELD_MESSAGE1}    ${EMPTY_FIELD_MESSAGE_VALUE}    timeout=10s
    Wait Until Element Contains    ${EMPTY_FIELD_MESSAGE2}    ${EMPTY_FIELD_MESSAGE_VALUE}    timeout=10s

    Input Text    ${URL_FIELD}    ${LINK_URL}
    Input Text    ${DESCRIPTION_FIELD}    ${DESCRIPTION}
    Click Element   ${DISPLAY_BANNER_ON_OF}
    Click Element   ${SAVE_BUTTON}


Verify Success
    Wait Until Element Contains    ${SAVE_MESSAGE}    ${SAVE_MESSAGE_VALUE}    timeout=10s

Log Out
    Wait Until Element Is Visible    ${FRI_LOGO}    timeout=10s
    Click Element    ${FRI_LOGO}
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}

*** Test Cases ***
Verify Baner Edit Success
    [Documentation]    This test case should test edit baner functionality on fresh.fri.uniza.sk
    [Tags]  T_5_Editacia_baneru

    [Setup]    Open Browser And Navigate To Login

    Login As Admin
    Find Baner To Edit
    Edit And Save Baner
    Verify Success
    Log Out

    [Teardown]    Close Browser