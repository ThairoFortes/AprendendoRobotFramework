*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource         ResourceAPI.robot
Suite Setup      Conectar a minha API


*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    #Conferir se retorna uma lista com todos os livros

# Buscar um livro específico (GET em um livro específico)
    #Conferir se retorna todos os dados corretos do livro 15

# Cadastrar um novo livro (POST)
    #Conferir se retorna todos os dados cadastrados para o novo livro

# Alterar um livro (PUT)
    #Conferir se retorna todos os dados alterados do livro 150

# Delerar um livro (DELETE)
    #Conferir se deleta o livro 200s


