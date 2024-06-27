# Sistema de Biblioteca - Instruções

Este sistema de biblioteca utiliza um banco de dados SQLite para armazenar informações sobre autores, livros, leitores, reservas e empréstimos. Abaixo estão as instruções para configuração do banco de dados, execução das consultas e utilização do sistema.

## Configuração do Banco de Dados

1. **Instalação do SQLite:**
   - Certifique-se de ter o SQLite instalado em seu ambiente de desenvolvimento. Você pode baixá-lo em [SQLite Download](https://www.sqlite.org/download.html).

2. **Criação do Banco de Dados:**
   - Execute o script `schema.sql` para criar as tabelas e definir a estrutura do banco de dados.

3. **Inserção de Dados Iniciais:**
   - Execute o script `insert_data.sql` para inserir dados de exemplo nas tabelas.

## Execução das Consultas

Para realizar consultas ao banco de dados, você pode utilizar o SQLite diretamente ou integrá-lo ao seu sistema através de uma linguagem de programação compatível.

Exemplos de consultas disponíveis no arquivo `query.sql` incluem:
- Selecionar todos os autores, livros, seções, leitores, reservas e empréstimos.
- Consultas avançadas como número de reservas por livro, autores com mais de 10 reservas, entre outras.

## Utilização do Sistema

Este sistema de biblioteca permite:
- Gerenciar informações de autores, livros, seções, leitores, reservas e empréstimos.
- Realizar consultas para obter informações específicas sobre o acervo da biblioteca e os usuários.

## Créditos

Este projeto foi desenvolvido por Leônidas Serra e Paulo Arthur como trabalho da disciplina de Banco de Dados ministrada pela Prof. Dra. Alana Araujo de Oliveira.

