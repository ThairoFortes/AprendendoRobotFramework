# Sessão de Confiruração 
*** Settings ***
Documentation    Essa suíte testa o site da Amazon
Resource         amazon_resources_bdd.robot
Test Setup       Dado o usuario esteja na homepage da Amazon
Test Teardown    Fechar o navegador

# Sessão de Testes
*** Test Cases *** 
Caso de Teste 01 - Acesso ao menu "Eletrônico"
    [Documentation]    Esse teste verifica o menu Ofertas do Dia e verifica a categoria Informática
    [Tags]             menus    categorias
    Quando seleciona o menu de Ofertas do Dia
    Entao apresenta a categoria "Cozinha"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Quando pesquisa pelo produto "Colchao Intex"
    Entao exibe o resultado para a pesquisa "Colchao Intex"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             carrinho
    Quando pesquisa pelo produto "Xbox Series S"
    E Adiciona o produto "Console Xbox Series S" no carrinho
    Entao o produto "Console Xbox Series S" foi adicionado no carrinho com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Quando pesquisa pelo produto "Xbox Series S"
    E Adiciona o produto "Console Xbox Series S" no carrinho    
    E remove o produto "Console Xbox Series S" do carrinho
    Entao o carrinho esta vazio
