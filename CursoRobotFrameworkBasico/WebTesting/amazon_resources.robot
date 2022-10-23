# Seção de Configuração
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                            https://www.amazon.com.br
${MENU_OFERTA_DO_DIA}             //a[@href='/deals?ref_=nav_cs_gb'][contains(.,'Ofertas do Dia')]
${CAMPO_PESQUISA}                 twotabsearchtextbox
${BOTAO_PESQUISAR}                nav-search-submit-button
${TEXTO_RESULTADOS}               //span[@class='a-color-state a-text-bold'][contains(.,'"Xbox Series S"')]
${BOTAO_ADD_CARRINHO}             add-to-cart-button
${BOTAO_IR_CARRINHO}              //a[@href='/gp/cart/view.html?ref_=sw_gtc'][contains(.,'Ir para o carrinho')]

# Seção de Implementação
*** Keywords ***
# Setup e Teardown
Dado o usuario esteja na homepage da Amazon
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=${URL}

Fechar o navegador
    Capture Page Screenshot
    Close Browser


# CT01
Quando seleciona o menu de Ofertas do Dia
    Wait Until Element Is Visible    locator=${MENU_OFERTA_DO_DIA}
    Click Element                    locator=${MENU_OFERTA_DO_DIA}

Entao apresenta a categoria "${CATEGORIA}"
    Wait Until Element Is Visible    locator=//span[@class='GridPresets-module__gridPresetsLargeItem_2xPgV2VoJCncjGPj18in1h'][contains(.,'${CATEGORIA}')]

# CT02
Quando pesquisa pelo produto "${TEXTO_PESQUISA}"
    Click Element    locator=${CAMPO_PESQUISA}        
    Input Text       locator=${CAMPO_PESQUISA}    text=${TEXTO_PESQUISA}
    Click Element    locator=${BOTAO_PESQUISAR}

Entao exibe o resultado para a pesquisa "${TEXTO_PESQUISA}"
    Wait Until Page Contains    text=${TEXTO_PESQUISA}

# CT03
E Adiciona o produto "${PRODUTO}" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Click Element    locator=${BOTAO_ADD_CARRINHO}    
    
Entao o produto "${PRODUTO}" foi adicionado no carrinho com sucesso
    Click Element    locator=${BOTAO_IR_CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

# CT04
E remove o produto "${PRODUTO}" do carrinho
    Entao o produto "${PRODUTO}" foi adicionado no carrinho com sucesso
    Click Element    locator=//input[contains(@value,'Excluir')]

Entao o carrinho esta vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

