-- Atividade para estudos da P2 

-- INSERTs

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



-- UPDATES

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