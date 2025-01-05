*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE URL}                 https://fresh.fri.uniza.sk
${LOGIN URL}                ${BASE URL}/login

# Input data - prihlasovacie údaje
${USERNAME}                 hrkut
${PASSWORD}                 fricka

# Locators - prihlasenie, odhlasenie
${USERNAME_FIELD}           xpath=//input[@id='login']
${PASSWORD_FIELD}           xpath=//input[@id='password']
${LOGIN_BUTTON}             xpath=//span[contains(.,'Prihlásiť')]
${LOGOUT_BUTTON}            xpath=//*[@id="app"]/div/div[6]/div[2]/div/span/span/a/span/span

# Locators - pridanie bloku
${CONTENT_BUTTON}           xpath=//*[@id="app"]/div/div[2]/div[1]/div[2]/div/div/span/div
${BLOCKS_BUTTON}            xpath=//div[@id='app']/div/div[2]/div/div[2]/div/div[2]/div/div[3]/div/a
${ADD_BLOCK_BUTTON}         css=.anticon-plus > svg
${LABEL_FIELD}              xpath=//input[@id='label_en']
${POSITION_FIELD}           xpath=//input[@id='position_en']
${SAVE_BUTTON}              css=button.ant-btn.ant-btn-primary

${FRAME_LOCATOR}            xpath=///html/body/div[1]/div/div[4]/div/form/div[2]/div/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div[2]/div[1]/iframe

# Locators pre panely
${RIGHT_PANEL_OPTION}       xpath=//div[@title='Pravý panel']
${BOTTOM_PANEL_OPTION}      xpath=//div[@title='Spodný panel']

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

Add New Block
    Wait Until Element Is Visible    ${ADD_BLOCK_BUTTON}    timeout=10s
    Click Element    ${ADD_BLOCK_BUTTON}

    Input Text    ${LABEL_FIELD}    test

    Wait Until Element Is Visible    ${POSITION_FIELD}    timeout=10s
    Click Element    ${POSITION_FIELD}

    Wait Until Element Is Visible    ${RIGHT_PANEL_OPTION}    timeout=10s
    Wait Until Element Is Visible    ${BOTTOM_PANEL_OPTION}   timeout=10s

    Click Element    ${RIGHT_PANEL_OPTION}

Click On Iframe And Display Text
    Select Frame     xpath=//html/body/div[1]/div/div[4]/div/form/div[2]/div/div/div[2]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div[2]/div[1]/iframe
    Input Text    xpath=//body    <p>test</p>
    Unselect Frame

Save Changes
    Click Element    ${SAVE_BUTTON}

*** Test Cases ***
Test Adding Block
    [Documentation]    Tento testovací prípad overuje funkčnosť pridania nového bloku na stránke fresh.fri.uniza.sk.
    [Tags]    pridanie_bloku

    [Setup]    Open Browser And Navigate To Login

    Login As Admin
    Navigate To Blocks
    Add New Block
    Click On Iframe And Display Text
    Save Changes

    [Teardown]    Close Browser
