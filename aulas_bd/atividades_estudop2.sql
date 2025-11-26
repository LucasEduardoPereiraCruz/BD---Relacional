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

INSERT INTO filmes_atores (ator_id, filme_id)
VALUES (201, 1002);

INSERT INTO filmes_categorias (filme_id, categoria_id)
VALUES (1002, 17);



-- UPDATES
