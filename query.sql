-- Consultas de  Seleção

-- Selecionar todos os autores
SELECT * FROM autores;

-- Selecionar todos os livros com seus autores
SELECT livros.*, autores.Nome AS NomeAutor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id;

-- Selecionar todas as seções com detalhes de livros e gênero
SELECT secao.*, livros.Titulo AS TituloLivro
FROM secao
INNER JOIN livros ON secao.livro_id = livros.id;

-- Selecionar todos os leitores
SELECT * FROM leitores;

-- Selecionar todos os empréstimos com detalhes de livro e leitor
SELECT emprestimos.*, livros.Titulo AS TituloLivro, leitores.Nome AS NomeLeitor
FROM emprestimos
INNER JOIN livros ON emprestimos.livro_id = livros.id
INNER JOIN leitores ON emprestimos.leitor_id = leitores.cpf;

-- Selecionar o número de reservas por livro, ordenado por quantidade de reservas
SELECT livros.id, livros.Titulo, COUNT(reserva.id) AS NumeroReservas
FROM livros
LEFT JOIN reserva ON livros.id = reserva.livro_id
GROUP BY livros.id, livros.Titulo
ORDER BY NumeroReservas DESC;

-- Selecionar autores que têm livros com mais de 10 reservas
SELECT DISTINCT autores.*
FROM autores
INNER JOIN livros ON autores.id = livros.autor_id
INNER JOIN reserva ON livros.id = reserva.livro_id
GROUP BY autores.id, autores.Nome
HAVING COUNT(reserva.id) > 10;

-- Selecionar todos os livros com menos de 5 exemplares disponíveis
SELECT * FROM livros
WHERE Quantidade < 5;

-- Selecionar todos os leitores que não fizeram nenhuma reserva
SELECT leitores.*
FROM leitores
LEFT JOIN reserva ON leitores.cpf = reserva.leitor_id
WHERE reserva.id IS NULL;

-- Selecionar todos os livros de um determinado gênero
SELECT livros.*
FROM livros
INNER JOIN secao ON livros.id = secao.livro_id
WHERE secao.Genero = 'Romance';

-- Selecionar autores e a quantidade de livros escritos por eles
SELECT autores.Nome, COUNT(livros.id) AS NumeroLivros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.Nome
ORDER BY NumeroLivros DESC;

-- Selecionar leitores e a quantidade de reservas feitas por eles
SELECT leitores.Nome, COUNT(reserva.id) AS NumeroReservas
FROM leitores
LEFT JOIN reserva ON leitores.cpf = reserva.leitor_id
GROUP BY leitores.Nome
ORDER BY NumeroReservas DESC;

-- Selecionar os livros e seus respectivos gêneros
SELECT livros.Titulo, secao.Genero
FROM livros
INNER JOIN secao ON livros.id = secao.livro_id;

-- Selecionar leitores com idade maior que 30 anos
SELECT * FROM leitores
WHERE Idade > 30;

-- Selecionar o número de leitores por faixa etária (grupos de 10 anos)
SELECT (Idade / 10) * 10 AS FaixaEtaria, COUNT(*) AS NumeroLeitores
FROM leitores
GROUP BY (Idade / 10) * 10
ORDER BY FaixaEtaria;

-- Selecionar todos os empréstimos atuais (em que a data de devolução é NULL)
SELECT emprestimos.*, livros.Titulo AS TituloLivro, leitores.Nome AS NomeLeitor
FROM emprestimos
INNER JOIN livros ON emprestimos.livro_id = livros.id
INNER JOIN leitores ON emprestimos.leitor_id = leitores.cpf
WHERE emprestimos.DataDevolucao IS NULL;

-- Selecionar todos os empréstimos devolvidos (em que a data de devolução não é NULL)
SELECT emprestimos.*, livros.Titulo AS TituloLivro, leitores.Nome AS NomeLeitor
FROM emprestimos
INNER JOIN livros ON emprestimos.livro_id = livros.id
INNER JOIN leitores ON emprestimos.leitor_id = leitores.cpf
WHERE emprestimos.DataDevolucao IS NOT NULL;

-- Selecionar leitores com mais de 3 empréstimos em andamento
SELECT leitores.*, COUNT(emprestimos.id) AS NumeroEmprestimos
FROM leitores
INNER JOIN emprestimos ON leitores.cpf = emprestimos.leitor_id
WHERE emprestimos.DataDevolucao IS NULL
GROUP BY leitores.cpf
HAVING COUNT(emprestimos.id) > 3;

-- Selecionar o número de empréstimos por livro, ordenado por quantidade de empréstimos
SELECT livros.id, livros.Titulo, COUNT(emprestimos.id) AS NumeroEmprestimos
FROM livros
LEFT JOIN emprestimos ON livros.id = emprestimos.livro_id
GROUP BY livros.id, livros.Titulo
ORDER BY NumeroEmprestimos DESC;

-- Selecionar os leitores que devolveram todos os livros que pegaram emprestados
SELECT leitores.*
FROM leitores
WHERE NOT EXISTS (
    SELECT 1
    FROM emprestimos
    WHERE emprestimos.leitor_id = leitores.cpf
    AND emprestimos.DataDevolucao IS NULL
);

-- Inserção de Dados

-- Inserir um novo autor
INSERT INTO autores (Nome, Nascimento, Falecimento, Nacionalidade)
VALUES ('Jane Austen', '1775-12-16', '1817-07-18', 'Britânica');

-- Inserir um novo livro
INSERT INTO livros (Titulo, Ano, Assunto, autor_id, Quantidade)
VALUES ('Orgulho e Preconceito', 1813, 'Romance', 6, 7);

-- Inserir uma nova seção
INSERT INTO secao (livro_id, Genero)
VALUES (6, 'Romance');

-- Inserir um novo leitor
INSERT INTO leitores (cpf, Nome, Email, telefone, DataNascimento, Idade)
VALUES ('22233344455', 'Carlos Pereira', 'carlos.pereira@email.com', '(41) 98765-4321', '1988-11-23', 35);

-- Inserir uma nova reserva
INSERT INTO reserva (livro_id, leitor_id)
VALUES (6, '22233344455');

-- Inserir um novo empréstimo
INSERT INTO emprestimos (livro_id, leitor_id, DataEmprestimo, DataDevolucao)
VALUES (6, '22233344455', '2024-01-20', '2024-02-03');

-- Atualização de Dados

-- Atualizar a quantidade de exemplares de um livro
UPDATE livros
SET Quantidade = 20
WHERE Titulo = 'Harry Potter e a Pedra Filosofal';

-- Atualizar o email de um leitor
UPDATE leitores
SET Email = 'ana.silva.novo@email.com'
WHERE cpf = '11122233344';

-- Atualizar a data de devolução de um empréstimo
UPDATE emprestimos
SET DataDevolucao = '2024-01-28'
WHERE livro_id = 3 AND leitor_id = '55566677788';

-- Exclusão de Dados

-- Excluir um autor
DELETE FROM autores
WHERE Nome = 'Clarice Lispector';

-- Excluir um livro
DELETE FROM livros
WHERE Titulo = 'A Hora da Estrela';

-- Excluir uma seção
DELETE FROM secao
WHERE livro_id = 5;

-- Excluir um leitor
DELETE FROM leitores
WHERE cpf = '12345678900';

-- Excluir uma reserva
DELETE FROM reserva
WHERE livro_id = 1 AND leitor_id = '12345678900';

-- Excluir um empréstimo
DELETE FROM emprestimos
WHERE livro_id = 1 AND leitor_id = '12345678900';