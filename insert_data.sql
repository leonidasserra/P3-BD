-- Inserção de dados na tabela Autores
INSERT INTO Autores (nome, nascimento, falecimento, nacionalidade)
VALUES 
    ('Machado de Assis', '1839-06-21', '1908-09-29', 'Brasileira'),
    ('J.K. Rowling', '1965-07-31', NULL, 'Britânica'),
    ('George Orwell', '1903-06-25', '1950-01-21', 'Britânica'),
    ('Gabriel García Márquez', '1927-03-06', '2014-04-17', 'Colombiana'),
    ('Clarice Lispector', '1920-12-10', '1977-12-09', 'Brasileira');

-- Inserção de dados na tabela Livros
INSERT INTO Livros (titulo, ano, assunto, autor_id, quantidade)
VALUES 
    ('Dom Casmurro', 1899, 'Romance', 1, 10),
    ('Harry Potter e a Pedra Filosofal', 1997, 'Fantasia', 2, 15),
    ('1984', 1949, 'Ficção Distópica', 3, 12),
    ('Cem Anos de Solidão', 1967, 'Realismo Mágico', 4, 8),
    ('A Hora da Estrela', 1977, 'Romance', 5, 5);

-- Inserção de dados na tabela Secao
INSERT INTO Secao (livro_id, genero)
VALUES 
    (1, 'Romance'),
    (2, 'Fantasia'),
    (3, 'Ficção Distópica'),
    (4, 'Realismo Mágico'),
    (5, 'Drama');

-- Inserção de dados na tabela Leitores
INSERT INTO Leitores (cpf, nome, email, telefone, datanascimento, idade)
VALUES 
    ('12345678900', 'João Silva', 'joao.silva@email.com', '(11) 98765-4321', '1980-01-15', 44),
    ('98765432100', 'Maria Souza', 'maria.souza@email.com', '(21) 12345-6789', '1992-05-30', 32),
    ('55566677788', 'Pedro Oliveira', 'pedro.oliveira@email.com', '(31) 55555-8888', '1985-09-20', 38),
    ('11122233344', 'Ana Silva', 'ana.silva@email.com', '(47) 98765-4321', '2000-07-12', 23);

-- Inserção de dados na tabela Reserva
INSERT INTO Reserva (livro_id, leitor_id)
VALUES 
    (1, '12345678900'),
    (2, '98765432100'),
    (3, '55566677788'),
    (5, '11122233344');

-- Inserção de dados na tabela Emprestimos
INSERT INTO Emprestimos (livro_id, leitor_id, dataemprestimo, datadevolucao)
VALUES 
    (1, '12345678900', '2024-01-01', '2024-01-15'),
    (2, '98765432100', '2024-01-05', '2024-01-20'),
    (3, '55566677788', '2024-01-10', NULL),
    (5, '11122233344', '2024-01-12', '2024-01-25');
