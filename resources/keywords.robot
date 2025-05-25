*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir Navegador
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    FOR    ${option}    IN    @{OPTIONS.split(';')}
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