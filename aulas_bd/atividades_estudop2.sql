-- Atividade para estudos da P2 
SELECT DATABASE();
-- 1 INSERTs

INSERT INTO atores (primeiro_nome, ultimo_nome) 
VALUES ('Carlos', 'Gomes');

INSERT INTO categorias (nome) 
VALUES ('Brasileiro');

-- EU TINHA COLOCADO PORTUGUÊS NA TABELA ERRADA
SELECT id_categoria, nome FROM categorias;

DELETE FROM categorias 
WHERE id_categoria = 18;
-- DELETE ^

INSERT INTO idiomas (nome) 
VALUES ('Português');

INSERT INTO paises (pais) 
VALUES ('Brasil');

INSERT INTO cidades (cidade, pais_id)
VALUES ('Rio de Janeiro', 110);

INSERT INTO enderecos (logradouro, bairro, codigo_postal, telefone, cidade_id)
VALUES ('Rua Copacabana, 10', 'Copacabana', '22000111', '2199998888', 601); 

INSERT INTO clientes (primeiro_nome, ultimo_nome, email, endereco_id, loja_id, criado_em)
VALUES ('Joana', 'Silva', 'joana@email.com', 606, 1, NOW());


INSERT INTO filmes (titulo, descricao, ano_lancamento, idioma_id, duracao_aluguel, taxa_aluguel, custo_reposicao) 
VALUES ('TÍTULO NOVO', 'Descrição...', 2025, 1, 5, 3.99, 19.99);


INSERT INTO filmes_atores (ator_id, filme_id)
VALUES (201, 1002);

INSERT INTO filmes_categorias (filme_id, categoria_id)
VALUES (1002, 17);



-- 2 UPDATES

-- Atualiza o ultimo nome do ator id = 1
UPDATE atores SET ultimo_nome = 'Cruz' WHERE id_ator = 1;

-- Atualiza o Email do cliente id = 1
UPDATE clientes SET email = 'mary.smith.new@email.com' WHERE id_cliente = 1;

-- Aumenta a taxa de aluguel de todos de classificação R 
UPDATE filmes SET taxa_aluguel =  taxa_aluguel + 1 WHERE classificacao = 'R' AND id_filme > 0;

-- Altera o endereco_id do cliente (id=15) para 20
UPDATE clientes SET endereco_id = 20 WHERE id_cliente = 15;

-- Atualiza a classificação do filme (id=2)
UPDATE filmes SET classificacao = 'PG-13' WHERE id_filme = 2;

-- Atualiza o telefone na tabela endereços 
UPDATE enderecos SET telefone = '11987654321' WHERE id_endereco = 10; 

-- Atualiza o cliente (id=16) para ativo = 0
UPDATE clientes SET ativo = 0 WHERE id_cliente = 16;

-- Atualiza o funcionario_gerente da loja 1 para funcionario_id = 2 -- PRIMEIRO TEMOS QUE REMOVER O 2 DE LA 
UPDATE lojas SET funcionario_gerente_id = 2 WHERE funcionario_gerente_id = 1; -- Não consegui fazer 

-- Atualiza a data de devolução do id = 100 com datas e horas atuais usando NOW()
UPDATE alugueis SET data_devolucao = NOW() WHERE id_aluguel = 100;

-- Diminui o custo de reposição em 10% para todos os filmes lançados antes de 2005
UPDATE filmes SET custo_reposicao = custo_reposicao * 0.9 WHERE ano_lancamento < 2005 AND id_filme > 0; -- Não existem filmes antes de 2005, mas caso existissem, o custo da reposição seria reduzido em 10%, está correto a linha



-- 3 DELETEs

-- Primeiro temos que deletar ele de uma tabela na qual ele existe
DELETE FROM filmes_atores 
WHERE ator_id = 201;

-- Agora deletamos ele da tabela principal atores
DELETE FROM atores 
WHERE id_ator = 201;

-- Deletando categoria 'Brasileiro' de filmes_categoria
DELETE FROM filmes_categorias
WHERE categoria_id = 17;

-- Deletando a categoria 'Brasileiro'
DELETE FROM categorias 
WHERE id_categoria = 17;

-- Deletando o idioma 'Português'
DELETE FROM idiomas
WHERE id_idioma = 7;

-- Deletando o pagamento com id_pagamento 5 
DELETE FROM pagamentos
WHERE id_pagamento = 5;

-- Deletando a associação de filmes_atores entre o filme_id 1 e o ator_id 10
DELETE FROM filmes_atores
WHERE ator_id = 10 AND filme_id = 1;

-- Deletando a cliente JOANA SILVA, assumindo que ela não possui aluguéis
DELETE FROM clientes 
WHERE id_cliente = 600;

-- Deletando o endereço de Copacabana 10 
DELETE FROM enderecos
WHERE id_endereco = 606;

-- Deletando o aluguel com id_aluguel 15 
DELETE FROM alugueis 
WHERE id_aluguel = 15;

-- Deletando o filme inserido 'TITULO NOVO' e assumindo que foi removido das tabelas de associação
DELETE FROM filmes
WHERE id_filme = 1002;

-- Deletando a cidade do Rio de Janeiro, assumindo que nenhum endereço utiliza 
DELETE FROM cidades
WHERE id_cidade = 601;



-- SELECTs
-- 4 Simples 

-- Mostrando no primeiro e último nome, ordenando pelo último nome 
-- Aqui ordenamos 
SELECT primeiro_nome, ultimo_nome 
FROM atores
ORDER BY ultimo_nome ASC;

-- Titulo e ano dos filmes com classificação PG-13
-- Aqui colocamos uma condição 
SELECT titulo, ano_lancamento
FROM filmes
WHERE classificacao = 'PG-13';

-- Contagem de quantos filmes existem para cada classificação 
-- Aqui colocamos um grupo 
SELECT classificacao, COUNT(*) AS filmes
FROM filmes 
GROUP BY classificacao;

-- E-mail e criado_em de todos os clientes que estão ativos, ordenados pelo criado_em (mais recentes primeiro)
SELECT email, criado_em FROM clientes WHERE ativo = 1 ORDER BY criado_em DESC; 		


-- Listando os 10 maiores pagamentos, ordenados pelo descendente 
-- Colocando limite dos 10 primeiros apenas
SELECT valor FROM pagamentos ORDER BY valor DESC LIMIT 10; 

 
-- Mostrando todos os endereços dos "District 9" (Chamei o Distrito Federal pq não achei o District 9)
SELECT * FROM enderecos WHERE bairro = 'Distrito Federal';


-- Contagem de quantos clientes estão associado a cada loja_id
SELECT loja_id, COUNT(*) AS clientes FROM clientes GROUP BY loja_id;


-- Todos os alugueis realizados pelo funcionário_id 1
SELECT * FROM alugueis WHERE funcionario_id = 1;

-- Taxa de aluguel, titulo e duracao dos filmes, a taxa sendo menor que 1.00 
SELECT titulo, taxa_aluguel, duracao FROM filmes WHERE taxa_aluguel < 1.00; 

-- Listando dos os países, ordenados por país em ordem alfabética 
SELECT * FROM paises ORDER BY pais;


-- 5 SELECT com funções 

-- Total de todos os pagamentos 
SELECT SUM(valor) FROM pagamentos;
-- Total mais completo (média, max e min) 
SELECT SUM(valor), AVG(valor), MAX(valor), MIN(valor) FROM pagamentos;


-- Calculando a taxa de aluguel (AVG) de todos os filmes 
SELECT AVG(taxa_aluguel), MAX(taxa_aluguel), MIN(taxa_aluguel) FROM filmes; 

-- Encontrando a menor MIN e o maior MAX de duração dos filmes  
SELECT MAX(duracao), MIN(duracao) FROM filmes;

-- Exibindo todos os nomes em uma única coluna (Usanbdo CONCAT())
SELECT CONCAT(primeiro_nome, ' ', ultimo_nome) AS nome FROM clientes;

-- Exibindo o nome de todos os títulos em letra maiúscula 
SELECT UPPER(titulo) FROM filmes;	

-- Contando quantos inventários tem a id_loja 2 
SELECT COUNT(*) FROM inventarios WHERE loja_id = 2;

-- Mostrando data de pagamento e o valor de todos os pagamentos, formatando a data com DATE FORMAT  
SELECT data_pagamento, valor, DATE_FORMAT(data_pagamento, '%d/%m/%Y') AS dia_pago FROM pagamentos;

-- Calculando o aluguel mais antigo (DATEDIFF)
SELECT DATEDIFF(NOW(), MIN(data_aluguel)) AS aluguel_mais_antigo FROM alugueis; 

-- Substituindo a descrição de DOCUMENTARY para DOCUMENTÁRIO de todos os filmes (REPLACE()) 
SELECT REPLACE(descricao, 'Documentary', 'Documentário') as documentario FROM filmes;	

-- Exibindo o titulo e o tamanho em caracteres do titulo, usando CHAR_LENGTH() dos 5 filmes com TITULOS MAIS LONGOS
SELECT titulo, CHAR_LENGTH(titulo) AS tamanho_titulo FROM filmes ORDER BY CHAR_LENGTH(titulo) DESC LIMIT 5; 


-- 7 SELECT com INNER JOIN 

-- Listando o titulo do filme e o nome do idioma de cada filme
SELECT titulo, nome FROM filmes INNER JOIN idiomas ON filmes.idioma_id = idiomas.id_idioma;


-- Exibindo o primeiro nome e o logradouro dela 
SELECT primeiro_nome, logradouro FROM clientes INNER JOIN enderecos ON clientes.endereco_id = enderecos.id_endereco;


-- Listando data de aluguel e primeiro_nome do cliente que realizou o aluguel 
SELECT data_aluguel, primeiro_nome FROM alugueis INNER JOIN clientes ON alugueis.cliente_id = clientes.id_cliente;


-- Primeiro nome do funcionário e o id_loja onde ele trabalha 
SELECT primeiro_nome, id_loja FROM funcionarios INNER JOIN lojas ON funcionarios.loja_id = lojas.id_loja;


-- Nome da cidade e o nome do pais correspondente 
SELECT cidade, pais FROM cidades INNER JOIN paises ON cidades.pais_id = paises.id_pais;


-- Listando o titulo e o nome dos atores (necessita de 3 tabelas, filmes, filmes_atores, atores)
SELECT titulo, primeiro_nome FROM filmes INNER JOIN filmes_atores ON filme_id = id_filme INNER JOIN atores ON ator_id = id_filme;


-- Titulo do filme, nome da categoria que ela pertence (requer 3 tabelas: filmes, categorias, filmes_categorias)
SELECT titulo, nome FROM filmes INNER JOIN filmes_categorias ON filme_id = id_filme INNER JOIN categorias ON categoria_id = id_categoria;


-- Listando o valor do pagamento e o primeiro nome do funcionário que o registrou 
SELECT valor, primeiro_nome FROM pagamentos INNER JOIN funcionarios ON pagamentos.funcionario_id = funcionarios.id_funcionario;


-- Listando o id_inventario, id_loja e o titulo do filme correspondente 
SELECT id_inventario, id_loja, titulo FROM inventarios INNER JOIN lojas ON inventarios.loja_id = lojas.id_loja INNER JOIN filmes ON inventarios.filme_id = filmes.id_filme;


-- Listar o primeiro nome, logradouro, cidade e pais do cliente (Requer 4 tabelas: clientes, enderecos, cidades, paises)
SELECT primeiro_nome, endereco_id, cidade, pais FROM clientes INNER JOIN enderecos ON clientes.endereco_id = enderecos.id_endereco INNER JOIN cidades ON enderecos.cidade_id = cidades.id_cidade INNER JOIN paises ON cidades.pais_id = paises.id_pais;



-- 7 SELECT com LEFT JOIN 

-- Listar todos os atores e filmes que atuaram (incluisive atores que não participaram de filme nenhum) 
SELECT primeiro_nome, titulo FROM atores LEFT JOIN filmes_atores ON id_ator = ator_id LEFT JOIN filmes ON filme_id = id_filme;


-- Listar todos os clientes e valores total de seus pagamentos (Usando SUM e GROUP BY, mostrando filmes que não foram alugados) 
SELECT primeiro_nome, SUM(valor) AS total_pago FROM clientes LEFT JOIN pagamentos ON id_cliente = cliente_id GROUP BY id_cliente;


-- Listar filmes e quantas vezes eles foram alugados (Usando COUNT e GROUP BY, mostrando tbm filmes nunca alugados) 
SELECT titulo, 	COUNT(id_aluguel) AS TOTAL_ALUGADOS FROM filmes LEFT JOIN inventarios ON id_filme = filme_id LEFT JOIN alugueis ON id_inventario = inventario_id GROUP BY id_filme;


-- Listar todas as categorias e o número de filmes de cada uma (Mostre categoria com 0 filmes)
SELECT nome, COUNT(id_filme) AS total_filmes_categorias FROM categorias LEFT JOIN filmes_categorias ON id_categoria = categoria_id LEFT JOIN filmes ON id_filme = filme_id GROUP BY id_categoria;


-- Encontrar alugueis que ainda não tem pagamento associados 
SELECT * FROM alugueis LEFT JOIN pagamentos ON id_aluguel = aluguel_id WHERE id_pagamento IS NULL; 


-- Listar paises e as cidades cadastradas (mostrar paises sem a cidade) 
SELECT pais, cidade FROM paises LEFT JOIN cidades ON id_pais = pais_id;


-- Listar todos os filmes e o nome do idioma_original_id (alguns podem ter o idioma nulo) 
SELECT titulo, idioma_original_id FROM filmes LEFT JOIN idiomas ON filmes.idioma_original_id = id_idioma;


-- Encontrando clientes que nunca fizeram um aluguel 
SELECT primeiro_nome, ultimo_nome FROM clientes LEFT JOIN alugueis ON id_cliente = cliente_id WHERE id_aluguel IS NULL;


-- Filmes sem cópias no inventário 
SELECT titulo FROM filmes LEFT JOIN inventarios ON filmes.id_filme = inventarios.filme_id WHERE inventarios.id_inventario IS NULL; 


-- Listar funcionarios e contagem de alugueis que cada um processou (mostre funcionários com 0 alugueis)
SELECT primeiro_nome, COUNT(data_aluguel) AS total_alugueis FROM funcionarios LEFT JOIN alugueis ON funcionarios.id_funcionario = alugueis.funcionario_id GROUP BY id_funcionario;



-- 8 SUBQUERYS (SUBCONSULTAS)

-- Lista todos os filmes da categoria ACTION 