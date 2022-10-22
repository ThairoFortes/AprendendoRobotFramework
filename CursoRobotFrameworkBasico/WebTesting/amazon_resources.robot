# Sessão de Configuração
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                            https://www.amazon.com.br
${MENU_OFERTA_DO_DIA}             //a[@href='/deals?ref_=nav_cs_gb'][contains(.,'Ofertas do Dia')]
${CAMPO_PESQUISA}                 //input[contains(@type,'text')]
${BOTAO_PESQUISAR}                //input[contains(@type,'submit')]
${TEXTO_RESULTADOS}               //span[@class='a-color-state a-text-bold'][contains(.,'"Xbox Series S"')]

# Sessão de Implementação
*** Keywords ***
# Setup e Teardown
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=${URL}

Fechar o navegador
    Close Browser


# CT01
Entrar no menu Ofertas do Dia
    Wait Until Element Is Visible    locator=${MENU_OFERTA_DO_DIA}
    Click Element                    locator=${MENU_OFERTA_DO_DIA}

Verificar se aparece a categoria "${CATEGORIA}"
    Wait Until Element Is Visible    locator=//span[@class='GridPresets-module__gridPresetsLargeItem_2xPgV2VoJCncjGPj18in1h'][contains(.,'${CATEGORIA}')]

# CT02
Pesquisar o produto "${TEXTO_PESQUISA}"
    Click Element    locator=${CAMPO_PESQUISA}        
    Input Text       locator=${CAMPO_PESQUISA}    text=${TEXTO_PESQUISA}
    Click Element    locator=${BOTAO_PESQUISAR}

Verificar se existe resultado para a pesquisa "${TEXTO_PESQUISA}"
    Wait Until Page Contains    text=${TEXTO_PESQUISA}
