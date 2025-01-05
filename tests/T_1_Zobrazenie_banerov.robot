*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}                 https://fresh.fri.uniza.sk
${LOGIN URL}                ${BASE URL}/login
 
# Input data
${USERNAME}                 hrkut
${PASSWORD}                 fricka
${SCREENSHOT_NAME}          user.png

 
# Locators - prihlasenie, odhlasenie
${ARROW_BUTTON}          xpath=//*[@id="app"]/div/div[5]/div/span[2]
${FIRST_BANNER}          xpath=//*[@id="app"]/div/div[5]/div/div/div/div[2]/div/a/img
${SECOND_BANNER}         xpath=//*[@id="app"]/div/div[5]/div/div/div/div[3]/div/a/img
${THIRD_BANNER}          xpath=//*[@id="app"]/div/div[5]/div/div/div/div[4]/div/a/img
${FORTH_BANNER}          xpath=//*[@id="app"]/div/div[5]/div/div/div/div[5]/div/a/img
${FIFTH_BANNER}          xpath=//*[@id="app"]/div/div[5]/div/div/div/div[6]/div/a/img
${SIXTH_BANNER}          xpath=//*[@id="app"]/div/div[5]/div/div/div/div[7]/div/a/img

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN URL}    Chrome
    Maximize Browser Window

Open Browser Fricka
    Open Browser     ${BASE URL}     Chrome
    Maximize Browser Window

Automatic Banner Changes
    Wait Until Element Is Visible    ${FIRST_BANNER}    timeout=5s
    Wait Until Element Is Visible    ${SECOND_BANNER}    timeout=5s
    Wait Until Element Is Visible    ${THIRD_BANNER}    timeout=5s
    Wait Until Element Is Visible    ${FORTH_BANNER}    timeout=5s
    Wait Until Element Is Visible    ${FIFTH_BANNER}    timeout=5s
    Wait Until Element Is Visible    ${SIXTH_BANNER}    timeout=5s

Arrow Button On Banner
    Wait Until Element Is Visible    ${FIRST_BANNER}    timeout=15s
    Click Element                    ${ARROW_BUTTON}
    Wait Until Element Is Visible    ${SECOND_BANNER}    timeout=15s
    Click Element    ${ARROW_BUTTON}
    Wait Until Element Is Visible    ${THIRD_BANNER}    timeout=15s
    Click Element    ${ARROW_BUTTON}
    Wait Until Element Is Visible    ${FORTH_BANNER}    timeout=15s
    Click Element    ${ARROW_BUTTON}
    Wait Until Element Is Visible    ${FIFTH_BANNER}    timeout=15s
    Click Element    ${ARROW_BUTTON}
    Wait Until Element Is Visible    ${SIXTH_BANNER}    timeout=15s
    Click Element    ${ARROW_BUTTON}
    Wait Until Element Is Visible    ${FIRST_BANNER}    timeout=15s

Banner Clickable Links
    Wait Until Element Is Visible    ${FIRST_BANNER}    timeout=45s
    Element Should Be Enabled        ${FIRST_BANNER}
    Click Element                    ${FIRST_BANNER}
    Go Back
    Click Element    ${ARROW_BUTTON}

    Wait Until Element Is Visible    ${SECOND_BANNER}    timeout=15s
    Element Should Be Enabled        ${SECOND_BANNER}
    Click Element                    ${SECOND_BANNER}
    Go Back
    Click Element    ${ARROW_BUTTON}

    Wait Until Element Is Visible    ${THIRD_BANNER}    timeout=15s
    Element Should Be Enabled        ${THIRD_BANNER}
    Click Element                    ${THIRD_BANNER}
    Go Back
    Click Element    ${ARROW_BUTTON}

    Wait Until Element Is Visible    ${FORTH_BANNER}    timeout=15s
    Element Should Be Enabled        ${FORTH_BANNER}
    Click Element                    ${FORTH_BANNER}
    Go Back
    Click Element    ${ARROW_BUTTON}

    Wait Until Element Is Visible    ${FIFTH_BANNER}    timeout=15s
    Element Should Be Enabled        ${FIFTH_BANNER}
    Click Element                    ${FIFTH_BANNER}
    Go Back
    Click Element    ${ARROW_BUTTON}

    Wait Until Element Is Visible    ${SIXTH_BANNER}    timeout=15s
    Element Should Be Enabled        ${SIXTH_BANNER}
    Click Element                    ${SIXTH_BANNER}
    Go Back
    Click Element    ${ARROW_BUTTON}


*** Test Cases ***
Verify Banners
    [Documentation]    This test case should test login functionality on fresh.fri.uniza.sk with valid login data
    [Tags]  login

    [Setup]    Open Browser Fricka
    #Automatic Banner Changes Nie je nutné robiť, je zahrnuťý v Banner Clickable Links
    Banner Clickable Links
    #Arrow Button On Banner
    [Teardown]    Close Browser