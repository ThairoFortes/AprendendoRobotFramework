### Sessão de Testes
*** Test Cases *** 
Caso de Teste 01 - Acesso ao menu "Eletrônico"
    [Documentation]    Esse teste verifica o menu Ofertas do Dia e verifica a categoria Informática
    [Tags]             menus    categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Ofertas do Dia"
    Verificar se aparece o titulo na aba "Ofertas e Promoções | Amazon.com.br"
    Verificar se aparece o titulo na tela "Ofertas e Promoções"
    Verificar se aparece a categoria "Informática"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se esta listando o produto pesquisado

