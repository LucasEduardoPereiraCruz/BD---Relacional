-- CRUD em SQL 

-- C -> Create = INSERT -> Insere os dados em uma tabela
INSERT INTO tabela (campo1, campo2, campo3)
	VALUES (valor1, 'valor2', 'YYYY-mm-dd');
    
INSERT INTO generos (nome) VALUES ('Ação');    

INSERT INTO generos (nome) VALUES ('RPG'), ('Mundo Aberto');

INSERT INTO clientes (id_cliente, nome, cpf, email, telefone, logradouro, criado_em, alterado_em, deletado_em)
	VALUES(NULL, 'Lucas Eduardo Pereira da Cruz', '111.111.111-01', 'lucascruzjau@gmail.com', '(14)9 8999-9999', 'Rua Jardim Norte', NOW(), NOW(), NULL);

-- R -> Read = SELECT -> Visualiza os dados presentes na tabela
-- Mostra todos os campos e todos os dados de uma tabela
SELECT * FROM generos; 

SELECT nome, deletado_em FROM generos;

SELECT * FROM clientes; 