CREATE TABLE autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    nascimento DATE,
    falecimento DATE,
    nacionalidade TEXT
);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    ano INTEGER,
    assunto TEXT,
    autor_id INTEGER,
    quantidade INTEGER,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE secao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    genero TEXT,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

CREATE TABLE leitores (
    cpf TEXT PRIMARY KEY,
    nome TEXT,
    email TEXT,
    telefone TEXT,
    datanascimento DATE,
    idade INTEGER
);

CREATE TABLE reserva (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER UNIQUE,
    leitor_id TEXT,
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    FOREIGN KEY (leitor_id) REFERENCES leitores(cpf)
);

CREATE TABLE emprestimos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER UNIQUE,
    leitor_id TEXT,
    dataemprestimo DATE,
    datadevolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros(id),
    FOREIGN KEY (leitor_id) REFERENCES leitores(cpf)
);
