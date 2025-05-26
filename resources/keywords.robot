*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.saucedemo.com/
${BROWSER}      chrome
${OPTIONS}      --headless=chrome;--no-sandbox;--disable-dev-shm-usage;--disable-gpu;--remote-debugging-port=9222;--user-data-dir=/tmp/chrome-profile
${USERNAME}     standard_user
${PASSWORD}     secret_sauce

*** Keywords ***
Abrir Navegador
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    @{option_list}=    Evaluate    """${OPTIONS}""".split(';')
    FOR    ${option}    IN    @{option_list}
        Call Method    ${chrome_options}    add_argument    ${option}
    END
    ${driver_path}=    Evaluate    sys.modules['webdriver_manager.chrome'].ChromeDriverManager().install().replace('\\\\', '/')    sys, webdriver_manager.chrome
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(r"${driver_path}")    sys, selenium.webdriver
    Create WebDriver    Chrome    service=${service}    options=${chrome_options}
    Maximize Browser Window
    Go To    ${URL}

Fazer Login
    Input Text      id=user-name    ${USERNAME}
    Input Password  id=password     ${PASSWORD}
    Click Button    id=login-button

Validar Login com Sucesso
    Wait Until Page Contains    Products