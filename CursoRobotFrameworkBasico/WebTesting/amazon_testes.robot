# Sessão de Confiruração 
*** Settings ***
Documentation    Essa suíte testa o site da Amazon
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

# Sessão de Testes
*** Test Cases *** 
Caso de Teste 01 - Acesso ao menu "Eletrônico"
    [Documentation]    Esse teste verifica o menu Ofertas do Dia e verifica a categoria Informática
    [Tags]             menus    categorias
    Entrar no menu Ofertas do Dia
    Verificar se aparece a categoria "Cozinha"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Pesquisar o produto "Colchao Intex"
    Verificar se existe resultado para a pesquisa "Colchao Intex"
