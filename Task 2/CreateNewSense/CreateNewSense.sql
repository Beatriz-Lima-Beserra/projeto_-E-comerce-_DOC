CREATE DATABASE db_newsense;

USE db_newsense;

CREATE TABLE tb_usuarios (
    Id INT PRIMARY KEY NOT NULL IDENTITY,
    Nome VARCHAR(255) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Documento VARCHAR(255) NOT NULL,
    CondicaoUsuario VARCHAR(255) NOT NULL CHECK
    (CondicaoUsuario IN ('Empresa Parceira', 'ONG Parceira', 'Pessoa Parceira')));

CREATE TABLE tb_produtos (
    Id INT PRIMARY KEY NOT NULL IDENTITY,
    Produto VARCHAR(255) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    QtdProduto INT NOT NULL,
    QtdLimite INT NOT NULL,
    URL_Imagem VARCHAR(255) NOT NULL);


CREATE TABLE tb_acao (
    FK_Usuario INT NOT NULL,
    FK_Produto INT NOT NULL,
    DataAcao DATE NOT NULL,
    QtdAcao INT NOT NULL,
    TipoAcao VARCHAR(255) NOT NULL CHECK
    (TipoAcao IN ('Doacao', 'Solicitacao'))
    FOREIGN KEY (FK_Usuario) REFERENCES tb_usuarios (Id),
    FOREIGN KEY (FK_Produto) REFERENCES tb_produtos (Id));