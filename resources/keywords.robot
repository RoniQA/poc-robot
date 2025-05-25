*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome
${OPTIONS}      --no-sandbox;--disable-dev-shm-usage;--disable-gpu;--remote-debugging-port=9222;--user-data-dir=/tmp/chrome-profile

*** Keywords ***
Abrir Navegador
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    @{option_list}=    Evaluate    """${OPTIONS}""".split(';')
    FOR    ${option}    IN    @{option_list}
        Call Method    ${chrome_options}    add_argument    ${option}
    END
    Create WebDriver    Chrome    options=${chrome_options}
    Maximize Browser Window
    Go To    ${URL}

Fazer Login
    Input Text      id=user-name    ${USERNAME}
    Input Password  id=password     ${PASSWORD}
    Click Button    id=login-button

Validar Login com Sucesso
    Wait Until Page Contains    Products