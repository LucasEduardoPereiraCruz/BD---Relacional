USE sakila_pt; 

SELECT SUM(valor), AVG(valor), Max(valor), MIN(valor) FROM pagamentos
WHERE data_pagamento < '2006-02-15'
GROUP BY funcionario_id;

-- Alteração da Visualização
SELECT UPPER(CONCAT(primeiro_nome, ' ',ultimo_nome)) AS nome, email
FROM clientes;


SELECT LOWER(titulo), titulo FROM filmes;

SELECT * FROM filmes WHERE LOWER(titulo) = ('A Batalha do Golfo');


-- DATE FORMAT - CONSULTAR A APOSTILA!!
SELECT id_pagamento AS id, CONCAT(clientes.primeiro_nome, ' ', clientes.ultimo_nome) AS nome_cliente, DATE_FORMAT(data_pagamento, '%d/%m/%Y') AS data_pagamento, valor,
FORMAT(valor, 2, 'pt-br') AS valor_pt
FROM pagamentos
INNER JOIN clientes ON pagamentos.cliente_id = clientes.id_cliente;

-- Subquery - Podemos inserir SELECTs dentro de outro SELECTs
-- para ampliar o poder de consulta em lugares que o JOIN não resolve 

-- Exibir cliente com pagamentos acima da média 
SELECT 
	CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) AS nome_cliente, 
    p.data_pagamento, 
    p.valor
FROM clientes c
INNER JOIN pagamentos p ON c.id_cliente = p.cliente_id
WHERE 
	p.valor > (
    -- Cria o resultado a ser utilizado para o IN 
    SELECT AVG(valor)
    FROM pagamentos
);

-- SELECT no FROM - Usamos os resultados do select para fazer novos filtros.ALTER
SELECT resultado.nome_cliente, resultado.valor 
FROM (
		SELECT 
			CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) AS nome_cliente, 
			p.data_pagamento, 
			p.valor
		FROM clientes c
		INNER JOIN pagamentos p ON c.id_cliente = p.cliente_id
		WHERE 
			p.valor > (
			-- Cria o resultado a ser utilizado para o IN 
			SELECT AVG(valor)
			FROM pagamentos
		)
	) AS resultado
WHERE resultado.valor < 6;

-- SELECT dentro do SELECT dentro do SELECT
SELECT 
	CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) AS nome_cliente, 
    p.data_pagamento, 
    p.valor
FROM clientes c
INNER JOIN pagamentos p ON c.id_cliente = p.cliente_id
WHERE 
	c.id_cliente IN (
		SELECT p.cliente_id FROM pagamentos p WHERE p.valor > (
			SELECT AVG(valor) FROM pagamentos 
        )
    )
GROUP BY nome_cliente  -- Prefira o GROUP BY ao DISTINCT
ORDER BY nome_cliente ASC;

-- Enunciado CHATGPT
-- Utilizando o banco de dados SAKILA, exiba o título de cada filme e, ao lado, uma subconsulta que mostre a quantidade de atores que participam de cada filme.

SELECT filme_id AS id, CONCAT(filmes_texto.titulo) AS nome_filme, filmes.duracao AS duracao_filme
FROM filmes
INNER JOIN filmes_texto ON filmes.id_filme = filmes_texto.filme_id;



SELECT 
	CONCAT(fm.titulo) AS nome_filme, 
    f.duracao
FROM filmes f
INNER JOIN filmes_texto fm ON f.id_filme = fm.filme_id
WHERE 
	f.duracao > (
    -- Cria o resultado a ser utilizado para o IN 
    SELECT AVG(duracao)
    FROM filmes
);


SELECT * FROM atores;

SELECT * FROM categorias;

SELECT * FROM idiomas;

SELECT * FROM paises;

SELECT * FROM cidades;

SELECT * FROM enderecos;

SELECT * FROM clientes;

SELECT * FROM filmes;

SELECT * FROM filmes ORDER BY id_filme DESC LIMIT 1;

SELECT * FROM filmes_atores;

SELECT * FROM filmes_categorias;

SELECT * FROM lojas;

SELECT * FROM funcionarios;

SELECT * FROM alugueis;

SELECT * FROM pagamentos;