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

${REC_BUTTON1}          xpath=//*[@id="app"]/div/div[5]/div/ul/li[1]/button
${REC_BUTTON2}          xpath=//*[@id="app"]/div/div[5]/div/ul/li[2]/button
${REC_BUTTON3}          xpath=//*[@id="app"]/div/div[5]/div/ul/li[3]/button
${REC_BUTTON4}          xpath=//*[@id="app"]/div/div[5]/div/ul/li[4]/button
${REC_BUTTON5}          xpath=//*[@id="app"]/div/div[5]/div/ul/li[5]/button
${REC_BUTTON6}          xpath=//*[@id="app"]/div/div[5]/div/ul/li[6]/button

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN URL}    Chrome
    Maximize Browser Window

Open Browser Fricka
    Open Browser     ${BASE URL}     Chrome
    Maximize Browser Window


Move to Banner
    Sleep    15s
    Click Element    ${REC_BUTTON1}
    Wait Until Element Is Visible    ${FIRST_BANNER}    timeout=5s
    Click Element    ${REC_BUTTON2}
    Wait Until Element Is Visible    ${SECOND_BANNER}    timeout=5s
    Click Element    ${REC_BUTTON3}
    Wait Until Element Is Visible    ${THIRD_BANNER}    timeout=5s
    Click Element    ${REC_BUTTON4}
    Wait Until Element Is Visible    ${FORTH_BANNER}    timeout=5s
    Click Element    ${REC_BUTTON5}
    Wait Until Element Is Visible    ${FIFTH_BANNER}    timeout=5s
    Click Element    ${REC_BUTTON1}
    Wait Until Element Is Visible    ${FIRST_BANNER}    timeout=5s

*** Test Cases ***
Rectangle Buttons On Banners
    [Documentation]    This test case should test login functionality on fresh.fri.uniza.sk with valid login data
    [Tags]  login

    [Setup]    Open Browser Fricka
    Move to Banner
    [Teardown]    Close Browser