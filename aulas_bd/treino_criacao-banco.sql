-- Treinamento de criação de banco 
CREATE DATABASE IF NOT EXISTS treinamento CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 

-- Mostra a criação do banco 
SHOW CREATE DATABASE treinamento; 

-- Usa o banco
USE treinamento; 

CREATE TABLE IF NOT EXISTS clientes(
	id_cliente BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, 
    cpf VARCHAR(14) NOT NULL UNIQUE, 
    telefone VARCHAR(30),
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP, 
    alterado DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL
);

CREATE TABLE IF NOT EXISTS produtos(
	id_produto BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco_unitario DECIMAL(10,2) NOT NULL,
    estoque DECIMAL(10,3) DEFAULT 0,
    codigo_barras VARCHAR(50) UNIQUE, 
    -- Logs
	criado_em DATETIME DEFAULT CURRENT_TIMESTAMP, 
    alterado DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL
);

CREATE TABLE IF NOT EXISTS vendas (
	id_venda BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id BIGINT UNSIGNED NOT NULL, 
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento ENUM('Dinheiro', 'Pix', 'Crédito', 'Débito'),
    observacoes TEXT,
    desconto DECIMAL(10,2) DEFAULT 0,
    total_venda DECIMAL(10,2) NOT NULL,
    -- Logs
	criado_em DATETIME DEFAULT CURRENT_TIMESTAMP, 
    alterado DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL,
     
    CONSTRAINT fk_vendas_clientes FOREIGN KEY(cliente_id) REFERENCES clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS itens_vendas(
	id_venda_produto BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    venda_id BIGINT UNSIGNED NOT NULL,
    produto_id BIGINT UNSIGNED NOT NULL,
    quantidade DECIMAL(10,3) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) DEFAULT 0,
    -- Logs
	criado_em DATETIME DEFAULT CURRENT_TIMESTAMP, 
    alterado DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    deletado_em DATETIME NULL,
    
    FOREIGN KEY(produto_id) REFERENCES produtos(id_produto),
    FOREIGN KEY(venda_id) REFERENCES vendas(id_venda)
);    

