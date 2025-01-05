*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}                 https://fresh.fri.uniza.sk
${LOGIN_URL}                ${BASE_URL}/login

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
${EDIT_BLOCK_BUTTON}        css=.ant-table-row .ant-btn .anticon-edit
${SAVE_BUTTON}              css=.ant-btn-primary
${SUCCESS_MESSAGE}          xpath=//body/div[2]/div/div/div/div/div

*** Keywords ***
Open Browser And Navigate To Login
    Open Browser    ${LOGIN_URL}    Chrome
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

Edit Block
    Wait Until Element Is Visible    ${EDIT_BLOCK_BUTTON}    timeout=10s
    Click Element    ${EDIT_BLOCK_BUTTON}

Save Changes
    Wait Until Element Is Visible    ${SAVE_BUTTON}    timeout=10s
    Click Element    ${SAVE_BUTTON}

Log Out
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}

Close Browser
    Close All Browsers

*** Test Cases ***
Test Edit Block
    [Documentation]    Tento testovací prípad overuje funkčnosť editovania bloku na stránke fresh.fri.uniza.sk.
    [Tags]    editovanie_blokov

    [Setup]    Open Browser And Navigate To Login
    Login As Admin
    Navigate To Blocks
    Edit Block
    Save Changes

    [Teardown]    Close Browser
