*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot

*** Test Cases ***
Teste de Login Válido
    Abrir Navegador
    Fazer Login
    Validar Login com Sucesso
    Close Browser