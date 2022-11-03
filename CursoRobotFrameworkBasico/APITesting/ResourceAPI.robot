*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library          RequestsLibrary
Library          Collections  

*** Variables ***
${URL_API}           https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}           id=15
...                  title=Book 15    
...                  description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...                  pageCount=1500
...                  excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

&{BOOK_Cadastrado}   id=46
...                  title=Teste Title   
...                  description=Teste Description
...                  pageCount=46
...                  excerpt=Teste Excerpt

&{BOOK_Alterado}     id=46
...                  title=Teste Title   
...                  description=Teste Description
...                  pageCount=46
...                  excerpt=Teste Excerpt
...                  publishDate=2019-11-03T00:09:05.520Z

*** Keywords ***
# Setup e Teardown
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}

Requisitar todos os livros
    ${RESPOSTA}    GET On Session    fakeAPI    Books
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    GET On Session    fakeAPI    Books/${ID_LIVRO}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo livro
    ${HEADERS}     Create Dictionary   content-type=application/json 
    ${RESPOSTA}    POST On Session     fakeAPI    Books
    ...                                data={"id": 46,"title": "Teste Title","description": "Teste Description","pageCount": 46,"excerpt": "Teste Excerpt","publishDate": "2022-11-02T23:36:27.014Z"}
    ...                                headers=${HEADERS} 
    Log                                ${RESPOSTA.text}
    Set Test Variable                  ${RESPOSTA} 

Alterar o livro "${ID_LIVRO}"
    ${HEADERS}     Create Dictionary   content-type=application/json 
    ${RESPOSTA}    PUT On Session      fakeAPI    Books/${ID_LIVRO}
    ...                                data={"id": 46,"title": "Teste Title","description": "Teste Description","pageCount": 46,"excerpt": "Teste Excerpt","publishDate": "2019-11-03T00:09:05.520Z"}
    ...                                headers=${HEADERS} 
    Log                                ${RESPOSTA.text}
    Set Test Variable                  ${RESPOSTA} 

Deletar o livro "${ID_LIVRO}"
    #${HEADERS}     Create Dictionary   content-type=application/json 
    ${RESPOSTA}    DELETE On Session   fakeAPI    Books/${ID_LIVRO}
    ...                                data={"id": 15}
    Log                                ${RESPOSTA.text}
    Set Test Variable                  ${RESPOSTA} 

# Conferências
Conferir o status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}         ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTD_LIVROS}" livros
    Length Should Be              ${RESPOSTA.json()}         ${QTD_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     id             ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     title          ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     description    ${BOOK_15.description}
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     pageCount      ${BOOK_15.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     excerpt        ${BOOK_15.excerpt}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados cadastrados para o novo livro
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     id             ${BOOK_Cadastrado.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     title          ${BOOK_Cadastrado.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     description    ${BOOK_Cadastrado.description}
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     pageCount      ${BOOK_Cadastrado.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     excerpt        ${BOOK_Cadastrado.excerpt}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados alterados do livro
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     id             ${BOOK_Alterado.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     title          ${BOOK_Alterado.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     description    ${BOOK_Alterado.description}
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     pageCount      ${BOOK_Alterado.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}     excerpt        ${BOOK_Cadastrado.excerpt}
    #Dictionary Should Contain Item    ${RESPOSTA.json()}     publishDate    ${BOOK_Alterado.publishDate}
