CREATE SCHEMA mapa;
USE mapa;

-- Criação da tabela Membro
CREATE TABLE Membro (
ID INT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Email VARCHAR(255) UNIQUE NOT NULL
);

-- Criação da tabela Membro_Telefones
CREATE TABLE Membro_Telefones (
ID INT PRIMARY KEY,
ID_Membro INT,
Tipo VARCHAR(20),
Numero VARCHAR(20),
FOREIGN KEY (ID_Membro) REFERENCES Membro(ID)
);

-- Criação da tabela Membro_Endereco
CREATE TABLE Membro_Endereco (
ID INT PRIMARY KEY,
ID_Membro INT,
Rua VARCHAR(255),
Numero VARCHAR(10),
Complemento VARCHAR(100),
CEP VARCHAR(10),
FOREIGN KEY (ID_Membro) REFERENCES Membro(ID)
);

-- Criação da tabela Autor
CREATE TABLE Autor (
ID_Autor INT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Nacionalidade VARCHAR(50) NOT NULL
);

-- Criação da tabela Editora
CREATE TABLE Editora (
ID INT PRIMARY KEY,
CNPJ VARCHAR(20) UNIQUE NOT NULL,
Nome VARCHAR(100) NOT NULL,
Cidade VARCHAR(100)
);

-- Criação da tabela Categoria
CREATE TABLE Categoria (
ID INT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Descricao TEXT

);

-- Criação da tabela Livro
CREATE TABLE Livro (
ID INT PRIMARY KEY,
ID_Membro INT,
ID_Editora INT,
ID_Categoria INT,
ISBN VARCHAR(20) UNIQUE NOT NULL,
Titulo VARCHAR(255) NOT NULL,
Ano_de_Publicacao INT NOT NULL,
Data_Emprestimo DATE,
Data_Devolucao DATE,
FOREIGN KEY (ID_Membro) REFERENCES Membro(ID),
FOREIGN KEY (ID_Editora) REFERENCES Editora(ID),
FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID)
);

-- Criação da tabela Escreve
CREATE TABLE Escreve (
ID INT PRIMARY KEY,
ID_Livro INT,
ID_Autor INT,
FOREIGN KEY (ID_Livro) REFERENCES Livro(ID),
FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor)
);