-- Treinamento de criação de banco 
CREATE DATABASE IF NOT EXISTS treinamento CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 

-- Mostra a criação do banco 
SHOW CREATE DATABASE treinamento; 

-- Usa o banco
USE treinamento; 

CREATE TABLE IF NOT EXISTS usuario(
	id_usuario BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(255) NOT NULL
);