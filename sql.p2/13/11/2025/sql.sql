/*Trigger*/

/*
um bloco de código SQL que é executado automaticamente pelo banco de dados quando ocorre um determinado evento(INSERT,UPDATE,DELETE)em uma tabela.alter

Utilidade:
1- Garantir a integridade de dados
2- Criar históricos de alterações (logs).
3- Execucação de calculos automáticos.
4- Enviar dados para outras tabelas (Espelhamento ou auditoria).
*/

CREATE DATABASE aula_13_11;
CREATE DATABASE aula_DB;
use  aula_13_11;

CREATE TABLE produtos(
id INT auto_increment PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT DEFAULT 0
);
CREATE TABLE log_produtos(
id INT auto_increment PRIMARY KEY,
produto_id INT,
acao VARCHAR(20),
data_acao timestamp default current_timestamp,
valor_antigo DECIMAL (10,2),
valor_novo DECIMAL (10,2)
);



CREATE TABLE log_estoque(
id INT auto_increment PRIMARY KEY,
produto varchar(100),
valor_antigo int,
valor_novo int,
data_hora timestamp default current_timestamp
);


-- CRIAR UM EXEMPLO 1 - TRIGGER DE AUDITORIA EM UPDATE
DELIMITER $$
CREATE TRIGGER trg_auditoria_preco
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
	IF OLD.preco <> NEW.preco THEN
		INSERT INTO log_produtos (produto_id,acao,valor_antigo,valor_novo)
		VALUES(OLD.id, 'ALTERACAO_PRECO' ,OLD.preco,NEW.preco);
	END IF;
END $$
DELIMITER ;
SHOW triggers;
drop trigger trg_auditoria_preco;
SELECT * FROM produtos;
SELECT * FROM log_produtos;

INSERT INTO produtos(nome,preco,estoque)
VALUES('Notebook',3500.00,10);

update produtos
set preco=3000.00
where id = 1;

-- Exemplo 2 prático 2 - Trigger Before Insert

DELIMITER $$
CREATE TRIGGER trg_valida_preco
BEFORE INSERT ON produtos
FOR EACH ROW

BEGIN
	IF NEW.preco <0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Preço não pode ser negativo';
	END IF;
END $$
DELIMITER ;

SHOW TRIGGERs;
INSERT INTO produtos(nome,preco,estoque)
VALUES("Mouse",-45.00,10);

/*

CRIA UM TRIGGER QUE SALVAR EM UMA TABELA DE HISTÓRICO O ESTOQUE
UPDATE E INSERT
*/
DELIMITER $$
CREATE TRIGGER trg_save_estoque
before INSERT ON produtos
FOR EACH ROW
BEGIN
	IF OLD.preco <> NEW.preco THEN
		INSERT INTO log_estoque (produto,valor_antigo,valor_novo)
		VALUES(OLD.id, 'ALTERACAO_PRECO' ,OLD.preco,NEW.preco);
	END IF;
END $$
DELIMITER ;

/*Transação*/

/*
Uma transação é um conjunto de operações SQL que devem ser executadas como uma unidade de trabalho. De forma geral,ou tudo é executado com sucesso,ou nada é aplicado

Exemplos de situações que exige transações:
1 - Transferência de dinheiro entre contas.
2 - Atualizações em múltiplas tabelas relacionadas
3 - Processos criticos que não podem ficar pela metade

ACID - Propriedades

A - Atomicidade - Todas as operações da transação são executadas completamente ou nenhuma é
C - Consistencia:o banco permanece em um estado válido,antes e depois da transação
I - Isolamento: Transações não interferem umas nas outras
D - Durabilidade:Após o COMMIT,as mudanças são permanentes mesmo após a falha

*/
	
-- COMANDOS

/*
START:TRANSACTION::inicia uma nova transação
COMMIT:confirma as operações de transação
ROLLBACK:Cancela as operações realizadas desde o ultimo commit ou savepoint
SAVEPOINT nome:Cria de restauração dentro da transação
ROLLBACK TO nome: Retorna ao ponto definido pelo SAVEPOINT
*/
USE aula_DB;   
Create TABLE contas(
id int auto_increment primary key,
nome varchar(50),
saldo decimal(10,2)
);
INSERT INTO contas(nome,saldo)
values
("Fabricio",1000.00),
("José",100.00);

-- INICIA A TRANSAÇÃO
START TRANSACTION;
-- 1- reTIRADA DE 200 CONTO DO FB

update contas
set saldo = saldo -200
where nome = 'Fabricio';

-- 2 -Adicionar 200 conto do js

update contas
set saldo = saldo +200
where nome = 'José';

-- SE TUDO DER CERTO

commit;

select*FROM contas;



















