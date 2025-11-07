CREATE DATABASE IF NOT EXISTS aula_reforco;
USE aula_reforco;
CREATE TABLE IF NOT EXISTS aa(
	id INT PRIMARY KEY    AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(20),
	sexo CHAR(1) NOT NULL,
    statu BOOL DEFAULT TRUE
);
SHOW TABLES;
DESCRIBE aa;
INSERT INTO aa( nome,sobrenome,sexo,statu) VALUES('pedro',"deafnti",'M',TRUE),('ana','silva','F',FALSE);
SELECT nome primeiro_nome,sobrenome ultimo_nome FROM aa;
ALTER TABLE aa ADD COLUMN idade INT NOT NULL;
ALTER TABLE aa MODIFY COLUMN idade INT NOT NULL;
INSERT INTO aa( nome,sexo) VALUES('pedro','M'),('ana','F');
SELECT* FROM aa;
ALTER TABLE aa MODIFY COLUMN idade INT NOT NULL;
UPDATE aa SET idade =12
WHERE id =1 OR id =4 OR id=3;
SELECT * FROM aa ORDER BY statu DESC;