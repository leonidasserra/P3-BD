CREATE TABLE autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome TEXT,
    Nascimento DATE,
    Falecimento DATE,
    Nacionalidade TEXT
);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Titulo TEXT,
    Ano INTEGER,
    Assunto TEXT,
    autor_id INTEGER,
    Quantidade INTEGER,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE secao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    Genero TEXT,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

CREATE TABLE leitores (
    cpf TEXT PRIMARY KEY,
    Nome TEXT,
    Email TEXT,
    telefone TEXT,
    DataNascimento DATE,
    Idade INTEGER
);

CREATE TABLE reserva (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    leitor_id TEXT,
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    FOREIGN KEY (leitor_id) REFERENCES leitores(cpf)
);

CREATE TABLE emprestimos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    leitor_id TEXT,
    DataEmprestimo DATE,
    DataDevolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    FOREIGN KEY (leitor_id) REFERENCES leitores(cpf)
);
