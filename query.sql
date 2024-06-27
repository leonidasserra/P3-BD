-- Consultas de  Seleção

-- Selecionar todos os autores
SELECT * FROM Autores;

-- Selecionar todos os livros com seus autores
SELECT livros.*, autores.nome AS nomeautor
FROM Livros
INNER JOIN Autores ON livros.autor_id = autores.id;

-- Selecionar todas as seções com detalhes de livros e gênero
SELECT secao.*, livros.titulo AS titulolivro
FROM Secao
INNER JOIN Livros ON secao.livro_id = livros.id;

-- Selecionar todos os leitores
SELECT * FROM Leitores;

-- Selecionar todos os empréstimos com detalhes de livro e leitor
SELECT emprestimos.*, livros.titulo AS titulolivro, leitores.nome AS nomeleitor
FROM Emprestimos
INNER JOIN Livros ON emprestimos.livro_id = livros.id
INNER JOIN Leitores ON emprestimos.leitor_id = leitores.cpf;

-- Selecionar o número de reservas por livro, ordenado por quantidade de reservas
SELECT livros.id, livros.titulo, COUNT(reserva.id) AS numeroreservas
FROM Livros
LEFT JOIN Reserva ON livros.id = reserva.livro_id
GROUP BY livros.id, livros.titulo
ORDER BY numeroreservas DESC;

-- Selecionar autores que têm livros com mais de 10 reservas
SELECT DISTINCT autores.*
FROM Autores
INNER JOIN Livros ON autores.id = livros.autor_id
INNER JOIN Reserva ON livros.id = reserva.livro_id
GROUP BY autores.id, autores.nome
HAVING COUNT(reserva.id) > 10;

-- Selecionar todos os livros com menos de 5 exemplares disponíveis
SELECT * FROM Livros
WHERE quantidade < 5;

-- Selecionar todos os leitores que não fizeram nenhuma reserva
SELECT leitores.*
FROM Leitores
LEFT JOIN Reserva ON leitores.cpf = reserva.leitor_id
WHERE reserva.id IS NULL;

-- Selecionar todos os livros de um determinado gênero
SELECT livros.*
FROM Livros
INNER JOIN Secao ON livros.id = secao.livro_id
WHERE secao.genero = 'Romance';

-- Selecionar autores e a quantidade de livros escritos por eles
SELECT autores.nome, COUNT(livros.id) AS numerolivros
FROM Autores
LEFT JOIN Livros ON autores.id = livros.autor_id
GROUP BY autores.nome
ORDER BY numerolivros DESC;

-- Selecionar leitores e a quantidade de reservas feitas por eles
SELECT leitores.nome, COUNT(reserva.id) AS numeroreservas
FROM Leitores
LEFT JOIN Reserva ON leitores.cpf = reserva.leitor_id
GROUP BY leitores.nome
ORDER BY numeroreservas DESC;

-- Selecionar os livros e seus respectivos gêneros
SELECT livros.titulo, secao.genero
FROM Livros
INNER JOIN Secao ON livros.id = secao.livro_id;

-- Selecionar leitores com idade maior que 30 anos
SELECT * FROM Leitores
WHERE idade > 30;

-- Selecionar o número de leitores por faixa etária (grupos de 10 anos)
SELECT (idade / 10) * 10 AS faixaetaria, COUNT(*) AS numeroleitores
FROM Leitores
GROUP BY (idade / 10) * 10
ORDER BY faixaetaria;

-- Selecionar todos os empréstimos atuais (em que a data de devolução é NULL)
SELECT emprestimos.*, livros.titulo AS titulolivro, leitores.nome AS nomeleitor
FROM Emprestimos
INNER JOIN Livros ON emprestimos.livro_id = livros.id
INNER JOIN Leitores ON emprestimos.leitor_id = leitores.cpf
WHERE emprestimos.datadevolucao IS NULL;

-- Selecionar todos os empréstimos devolvidos (em que a data de devolução não é NULL)
SELECT emprestimos.*, livros.titulo AS titulolivro, leitores.nome AS nomeleitor
FROM Emprestimos
INNER JOIN Livros ON emprestimos.livro_id = livros.id
INNER JOIN Leitores ON emprestimos.leitor_id = leitores.cpf
WHERE emprestimos.datadevolucao IS NOT NULL;

-- Selecionar leitores com mais de 3 empréstimos em andamento
SELECT leitores.*, COUNT(emprestimos.id) AS numeroemprestimos
FROM Leitores
INNER JOIN Emprestimos ON leitores.cpf = emprestimos.leitor_id
WHERE emprestimos.datadevolucao IS NULL
GROUP BY leitores.cpf
HAVING COUNT(emprestimos.id) > 3;

-- Selecionar o número de empréstimos por livro, ordenado por quantidade de empréstimos
SELECT livros.id, livros.titulo, COUNT(emprestimos.id) AS numeroemprestimos
FROM Livros
LEFT JOIN Emprestimos ON livros.id = emprestimos.livro_id
GROUP BY livros.id, livros.titulo
ORDER BY numeroemprestimos DESC;

-- Selecionar os leitores que devolveram todos os livros que pegaram emprestados
SELECT leitores.*
FROM Leitores
WHERE NOT EXISTS (
    SELECT 1
    FROM Emprestimos
    WHERE emprestimos.leitor_id = leitores.cpf
    AND emprestimos.datadevolucao IS NULL
);

-- Inserção de Dados

-- Inserir um novo autor
INSERT INTO Autores (nome, nascimento, falecimento, nacionalidade)
VALUES ('Jane Austen', '1775-12-16', '1817-07-18', 'Britânica');

-- Inserir um novo livro
INSERT INTO Livros (titulo, ano, assunto, autor_id, quantidade)
VALUES ('Orgulho e Preconceito', 1813, 'Romance', 6, 7);

-- Inserir uma nova seção
INSERT INTO Secao (livro_id, genero)
VALUES (6, 'Romance');

-- Inserir um novo leitor
INSERT INTO Leitores (cpf, nome, email, telefone, datanascimento, idade)
VALUES ('22233344455', 'Carlos Pereira', 'carlos.pereira@email.com', '(41) 98765-4321', '1988-11-23', 35);

-- Inserir uma nova reserva
INSERT INTO Reserva (livro_id, leitor_id)
VALUES (6, '22233344455');

-- Inserir um novo empréstimo
INSERT INTO Emprestimos (livro_id, leitor_id, dataemprestimo, datadevolucao)
VALUES (6, '22233344455', '2024-01-20', '2024-02-03');

-- Atualização de Dados

-- Atualizar a quantidade de exemplares de um livro
UPDATE Livros
SET quantidade = 20
WHERE titulo = 'Harry Potter e a Pedra Filosofal';

-- Atualizar o email de um leitor
UPDATE Leitores
SET email = 'ana.silva.novo@email.com'
WHERE cpf = '11122233344';

-- Atualizar a data de devolução de um empréstimo
UPDATE Emprestimos
SET datadevolucao = '2024-01-28'
WHERE livro_id = 3 AND leitor_id = '55566677788';

-- Exclusão de Dados

-- Excluir um autor
DELETE FROM Autores
WHERE nome = 'Clarice Lispector';

-- Excluir um livro
DELETE FROM Livros
WHERE titulo = 'A Hora da Estrela';

-- Excluir uma seção
DELETE FROM Secao
WHERE livro_id = 5;

-- Excluir um leitor
DELETE FROM Leitores
WHERE cpf = '12345678900';

-- Excluir uma reserva
DELETE FROM Reserva
WHERE livro_id = 1 AND leitor_id = '12345678900';

-- Excluir um empréstimo
DELETE FROM Emprestimos
WHERE livro_id = 1 AND leitor_id = '12345678900';
