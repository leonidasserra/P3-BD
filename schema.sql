CREATE TABLE Autores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    nascimento DATE,
    falecimento DATE,
    nacionalidade TEXT
);

CREATE TABLE Livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    ano INTEGER,
    assunto TEXT,
    autor_id INTEGER,
    quantidade INTEGER,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);

CREATE TABLE Secao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER,
    genero TEXT,
    FOREIGN KEY (livro_id) REFERENCES Livros(id)
);

CREATE TABLE Leitores (
    cpf TEXT PRIMARY KEY,
    nome TEXT,
    email TEXT,
    telefone TEXT,
    datanascimento DATE,
    idade INTEGER
);

CREATE TABLE Reserva (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER UNIQUE,
    leitor_id TEXT,
    FOREIGN KEY (livro_id) REFERENCES Livros(id),
    FOREIGN KEY (leitor_id) REFERENCES Leitores(cpf)
);

CREATE TABLE Emprestimos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livro_id INTEGER UNIQUE,
    leitor_id TEXT,
    dataemprestimo DATE,
    datadevolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES Livros(id),
    FOREIGN KEY (leitor_id) REFERENCES Leitores(cpf)
);
