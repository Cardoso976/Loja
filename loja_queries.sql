UPDATE clientes 
SET nome=?, endereco=?, cidade=?, estado=?, email=?, senha=? 
WHERE codigo = ?;

UPDATE produtos 
SET titulo=?, autor=?, url=?, preco=?, quantidade_estoque=? 
WHERE codigo = ?;

DELETE 
FROM clientes 
WHERE codigo = ?;

DELETE 
FROM produtos 
WHERE codigo = ?;

SELECT * 
FROM clientes 
WHERE codigo = ?;

SELECT * 
FROM produtos 
WHERE codigo = ?;

SELECT * 
FROM clientes 
ORDER BY nome;

SELECT pedidos.codigo, clientes.nome as nome_cliente, produtos.titulo as titulo_produto, 
	   pedidos.codigo_do_produto,pedidos.quantidade_comprada, pedidos.preco_unitario 
FROM ((pedidos INNER JOIN clientes ON clientes.codigo = pedidos.codigo_do_cliente)
               INNER JOIN produtos ON produtos.codigo = pedidos.codigo_do_produto) 
ORDER BY codigo DESC;

SELECT * 
FROM produtos 
ORDER BY titulo;

SELECT * 
FROM produtos;

SELECT * 
FROM clientes 
WHERE email = ? AND senha = ?;

INSERT INTO produtos (titulo, autor, url, preco, quantidade_estoque) 
VALUES (?,?,?,?,?);

INSERT INTO clientes (nome, endereco, cidade, estado, email, senha) 
VALUES (?,?,?,?,?,?);

INSERT INTO pedidos (codigo_do_cliente, codigo_do_produto, quantidade_comprada, preco_unitario) 
VALUES (?,?,?,?);

UPDATE produtos 
SET quantidade_estoque=? 
WHERE codigo = ?;