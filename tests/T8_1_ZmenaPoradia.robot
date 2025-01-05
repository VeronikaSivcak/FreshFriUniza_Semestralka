*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}                 https://fresh.fri.uniza.sk
${LOGIN URL}                ${BASE_URL}/login

# Input data - prihlasovacie údaje
${USERNAME}                 hrkut
${PASSWORD}                 fricka

# Locators - prihlasenie, odhlasenie
${USERNAME_FIELD}           xpath=//input[@id='login']
${PASSWORD_FIELD}           xpath=//input[@id='password']
${LOGIN_BUTTON}             xpath=//span[contains(.,'Prihlásiť')]
${LOGOUT_BUTTON}            xpath=//*[@id="app"]/div/div[6]/div[2]/div/span/span/a/span/span

# Locators - bloky
${CONTENT_BUTTON}           xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div/span/div
${BLOCKS_BUTTON}            xpath=//div[@id='app']/div/div[2]/div/div[2]/div/div[2]/div/div[3]/div/a
${ORDER_BUTTON}             css=.ant-btn.ant-btn-circle.ant-btn-lg .anticon-sort-ascending
${BLOCK_DRAG_SOURCE}        css=.dragging
${BLOCK_DROP_TARGET}        css=.drop-target
${SAVE_BUTTON}              xpath=//div[@id='app']/div/div[4]/div[2]/button/span

# Locators - zoradenie tlačidla
${ZORADENIE_BUTTON}         xpath=//div[contains(@class, 'ant-tooltip-open')]//button[contains(@class, 'ant-btn')]

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN URL}    Chrome
    Maximize Browser Window

Login As Admin
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}

Navigate To Blocks
    Wait Until Element Is Visible    ${CONTENT_BUTTON}    timeout=10s
    Click Element    ${CONTENT_BUTTON}
    Wait Until Element Is Visible    ${BLOCKS_BUTTON}    timeout=10s
    Click Element    ${BLOCKS_BUTTON}

Order Blocks Section
    Wait Until Element Is Visible    ${ORDER_BUTTON}    timeout=10s
    Click Element    ${ORDER_BUTTON}

Change Block Order
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'title-wrapper') and text()='Kalendár']    timeout=10s
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'title-wrapper') and text()='Prijímacie konanie']    timeout=10s
    Drag And Drop   xpath=//div[contains(@class, 'title-wrapper') and text()='Kalendár']    xpath=//div[contains(@class, 'title-wrapper') and text()='Prijímacie konanie']

Save Changes
    Click Element    ${SAVE_BUTTON}

Log Out
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}

Close Browser
    Close All Browsers

*** Test Cases ***
Test Change Block Order
    [Documentation]    Test zmeny poradia blokov.
    [Tags]    zmena_poradia

    [Setup]    Open Browser And Navigate To Login

    Login As Admin
    Navigate To Blocks
    Order Blocks Section
    Change Block Order
    Save Changes

    [Teardown]    Close Browser
