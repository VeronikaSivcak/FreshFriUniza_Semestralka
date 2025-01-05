*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections

*** Variables ***
${BASE URL}                 https://fresh.fri.uniza.sk
${LOGIN URL}                ${BASE URL}/login
 
# Input data
${USERNAME}                 hrkut
${PASSWORD}                 fricka
${SCREENSHOT_NAME}          user.png
${DESCRIPTION}              hello
${LINK_URL}                 https://www.google.sk/?hl=sk
${SEARCH_STRING}            m

 
# Locators - prihlasenie, odhlasenie
${USERNAME_FIELD}        xpath=//input[@type='text']
${PASSWORD_FIELD}        id=password
${URL_SEARCH_INPUT}      xpath=/html/body/div[3]/div/div/div/span/span/span[1]/input
${LOGIN_BUTTON}          xpath=//button[@type='submit']
${FRI_LOGO}              xpath=//*[@id="app"]/div/div[1]/div[1]/a/img
${LOGOUT_BUTTON}         xpath=//*[@id="app"]/div/div[6]/div[2]/div/span/span/a/span/span
${CONTENT_BUTTON}        xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div/span/div
${BANERS_BUTTON}         xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div[2]/div/div[7]/div/a
${BANERS_URL}            xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[2]
${BANERS_POPIS}          xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[3]
${BANERS_PORADIE}        xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[4]
${BANERS_AKTIVNY}        xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[5]
${BUTTON_AZ}             xpath=//*[@id="app"]/div/div[3]/div/div[2]/div[2]/button
${BUTTON_PLUS}           xpath=//*[@id="app"]/div/div[3]/div/div[2]/div[1]/button
${BUTTON_BACKARROW}      xpath=//*[@id="app"]/div/div[3]/div/div[1]/div[1]/button
${PROFLE_TITLE}          xpath=//*[@id="app"]/div/div[3]/div/div[1]/div
${ADD_TITLE}             xpath=//*[@id="app"]/div/div[3]/div/div[1]/div[2]
${SORT_TITLE}            xpath=//*[@id="app"]/div/div[3]/div/div[1]/div[2]
${URL_FILTER}            xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[2]/div/span[2]
${POPIS_FILTER}          xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[3]/div/span[2]
${AKTIVNY_FILTER}        xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[5]/div/span[2]
${RESET_FILTER}          xpath=//*[@id="app"]/div/div[4]/div/div/div/div/div/div/div/div/div/table/thead/tr/th[5]/div/span[2]
${BUTTON_INPUT}          xpath=/html/body/div[3]/div/div/div/span/span/span[2]/button
${OK_BUTTON}             xpath=/html/body/div[4]/div/div/div[2]/button[2]
${NO_CHECKBOX}           xpath=/html/body/div[4]/div/div/ul/li[1]/span/label


*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN URL}    Chrome
    Maximize Browser Window


Login As Admin
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Capture element screenshot  ${USERNAME_FIELD}    ${SCREENSHOT_NAME}
    Click Button    ${LOGIN_BUTTON}

Go To Banners
    Wait Until Element Is Visible    ${CONTENT_BUTTON}    timeout=10s
    Click Element    ${CONTENT_BUTTON}
    Wait Until Element Is Visible    ${BANERS_BUTTON}    timeout=10s
    Click Element    ${BANERS_BUTTON}

Log Out
    Wait Until Element Is Visible    ${FRI_LOGO}    timeout=10s
    Click Element    ${FRI_LOGO}
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}

*** Keywords ***
Verify Clickable
    Wait Until Element Is Visible    ${BANERS_PORADIE}    timeout=10s
    Click Element                    ${BANERS_PORADIE}
    Sleep                            2s
    Click Element                    ${BANERS_PORADIE}
    Sleep                            2s

    Click Element                    ${BANERS_AKTIVNY}
    Sleep                            2s
    Click Element                    ${BANERS_AKTIVNY}
    Sleep                            2s

    Click Element                    ${BANERS_POPIS}
    Sleep                            2s
    Click Element                    ${BANERS_POPIS}
    Sleep                            2s

    Click Element                    ${BANERS_URL}
    Sleep                            2s
    Click Element                    ${BANERS_URL}

Buttons Are Working
    Wait Until Element Is Visible    ${BUTTON_AZ}    timeout=10s
    Click Element                    ${BUTTON_AZ}
    Sleep                            2s
    Element should be visible        ${SORT_TITLE}
    Go back

    Wait Until Element Is Visible    ${BUTTON_PLUS}    timeout=10s
    Click Element                    ${BUTTON_PLUS}
    Sleep                            2s
    Element should be visible        ${ADD_TITLE}
    Go back

    Wait Until Element Is Visible    ${BUTTON_BACKARROW}    timeout=10s
    Sleep                            2s
    Click Element                    ${BUTTON_BACKARROW}
    Sleep                            2s
    Element should be visible        ${PROFLE_TITLE}

Filters Are Working
    Wait Until Element Is Visible    ${URL_FILTER}    timeout=10s
    Click Element                    ${URL_FILTER}
    Wait Until Element Is Visible    ${POPIS_FILTER}  timeout=10s
    Click Element                    ${POPIS_FILTER}
    Wait Until Element Is Visible    ${AKTIVNY_FILTER}  timeout=10s
    Click Element                    ${AKTIVNY_FILTER}
    Wait Until Element Is Visible    ${NO_CHECKBOX}
    Click Element                    ${NO_CHECKBOX}
    Sleep    1s
    Wait Until Element Is Visible    ${OK_BUTTON}
    Click Element                    ${OK_BUTTON}
    Sleep    2s
    Wait Until Element Is Visible    ${RESET_FILTER}  timeout=10s
    Click Element                    ${RESET_FILTER}
    Sleep    1s

*** Test Cases ***
Verify Clickable
    [Documentation]    This test case should test login functionality on fresh.fri.uniza.sk with valid login data
    [Tags]  login

    [Setup]    Open Browser And Navigate To Login
    Login As Admin
    Go To Banners
    Verify Clickable
    Log Out
    [Teardown]    Close Browser

Verify All Buttons
    [Documentation]    This test case should test login functionality on fresh.fri.uniza.sk with valid login data
    [Tags]  login

    [Setup]    Open Browser And Navigate To Login
    Login As Admin
    Go To Banners
    Buttons Are Working
    Log Out
    [Teardown]    Close Browser

Verify Filters
    [Documentation]    This test case should test login functionality on fresh.fri.uniza.sk with valid login data
    [Tags]  login

    [Setup]    Open Browser And Navigate To Login
    Login As Admin
    Go To Banners
    Filters Are Working
    Log Out
    [Teardown]    Close Browser