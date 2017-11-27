DROP DATABASE IF EXISTS fatec_shop;

CREATE DATABASE fatec_shop;

USE fatec_shop;

CREATE TABLE clientes(
	codigo int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome varchar(100) NOT NULL,
	endereco varchar(100),
	cidade varchar(30),
	estado char(2),
	email varchar(30),
	senha varchar(15)
);

CREATE TABLE produtos(
	codigo int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	titulo varchar(45),
	autor varchar(45),
	url varchar(50),	
	preco decimal(7,2),
	quantidade_estoque int	
);

CREATE TABLE pedidos(
	codigo int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	codigo_do_cliente int,
	codigo_do_produto int, 
	quantidade_comprada int, 
	CONSTRAINT FOREIGN KEY FK_clientes(codigo_do_cliente)
		REFERENCES clientes(codigo),
	CONSTRAINT FOREIGN KEY FK_produtos(codigo_do_produto)
		REFERENCES produtos(codigo)
);

INSERT INTO clientes(nome,endereco,cidade,estado,email,senha) 
VALUES 
	('Rodrigo','Rua Maceio 407','Garca','SP','rodrigo_cardoso97@hotmail.com','1234'),
	('Admin','Rua Maceio 407','Garca','SP','Admin','admin');

INSERT INTO produtos(titulo, autor, url, preco, quantidade_estoque)
VALUES
	('Don Quixote','Miguel de Cervantes','img/donquixote.jpg',25.50,15),
	('Um Conto de Duas Cidades','John Ronald Reuel Tolkien','img/umcontodeduascidades.jpg',22.63,8),
	('O Senhor dos Aneis','Miguel de Cervantes','img/senhordosaneis.jpg',88.64,5),
	('O Pequeno Principe','Antoine de Saint-Exupery','img/opequenoprincipe.jpg',12.09,31),	
	('O Hobbit','John Ronald Reuel Tolkien','img/ohobbit.jpg',82.23,2),
	('O Caso dos Dez Negrinhos','Agatha Christie','img/deznegrinhos.jpg',107.90,7),
	('O Sonho da Camara Vermelha','Cao Xueqin','img/shonhodacamaravermelha.jpg',174.90,1),
	('Ela, a Feiticeira','Henry Rider Haggard','img/elaafeiticeira.jpg',157.12,12),
	('Harry Potter e a Pedra Filosofal','Joanne Rowling','img/harrypotter.jpg',102.70,3);
	
	