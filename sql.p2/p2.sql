CREATE DATABASE escola;
USE escola;
 create table alunos(
id int auto_increment primary key,
nome varchar(50) not null,
curso varchar(50) not null,
nota decimal(4,2)
 );
 
 insert into alunos(nome,curso,nota)
 values
('Ana',"Engenharia",8.5),
('bruno',"Direito",9.5),
('Carla',"Engenharia",7.2),
('Daniel',"Aministração",6.8),
('Eduardo',"Direito",8.8);
select * from alunos;

/*VIEW*/
/*
Uma view(visão) é uma tabela virtual criada a partir do resultado de uma consulta SQL(SELECT)
Ela ñ armazena dados fisicamente mas sim uma forma de visualiza dados de uma ou + tabelas

Pense assim:uma view é uma janela q mostra...alter
*/
-- como criar uma view

-- visualizar os alunos que tenham os curso engenharia
create view vw_engenharia as 
select nome,nota from alunos
where curso='Engenharia';

-- Consultar uma view
select * from vw_engenharia;

-- views com agregaçãoptimize
-- podemos criara uma view pra mstrar a média de notas por curso

create view vw_media_cursos as 
select curso,avg(nota) as media
from alunos
group by curso;

select * from vw_media_cursos;

-- criar ou modificar uma view

create or replace view vw_engenharia as 
select nome,curso from alunos
where curso='Engenharia' and nota >=8;

-- dropar ou excluir uma view

drop view vw_engenharia;

/*
nem todas as views podem ser atualizadas (com UPTADE,insert,DELETE)
JOIN,GROUP BY,DISTINT ou funções agregadas
Nesse caso elas servem apenas pra consultar
*/
create view vw_recuperacao as 
select id,nome,curso,nota
from alunos
where nota <7;
select * from vw_recuperacao;

update vw_recuperacao
set nota=7.0
where nome='Daniel';


DROP DATABASE IF EXISTS loja_subquery;
CREATE DATABASE loja_subquery;
USE loja_subquery;

-- 1) Tabela de clientes
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cidade VARCHAR(80) NOT NULL
);

-- 2) Tabela de produtos
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);

-- 3) Tabela de pedidos
CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  data_pedido DATE DEFAULT (CURRENT_DATE()),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- 4) Itens dos pedidos
CREATE TABLE itens_pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  id_produto INT,
  quantidade INT,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
  FOREIGN KEY (id_produto) REFERENCES produtos(id)
);




INSERT INTO clientes (nome, cidade) VALUES
('Ana', 'Maricá'),
('Bruno', 'Niterói'),
('Clara', 'Maricá'),
('Diego', 'São Gonçalo');

INSERT INTO clientes (nome, cidade) VALUES
('Camila', 'Maricá');


INSERT INTO produtos (nome, preco) VALUES
('Teclado', 120.00),
('Mouse', 80.00),
('Monitor', 900.00),
('Cadeira Gamer', 1200.00);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2024-10-01'),
(2, '2024-10-05'),
(3, '2024-10-06'),
(4, '2024-10-07');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 2),  -- Ana comprou 2 teclados
(1, 2, 1),
(2, 3, 1),  -- Bruno comprou 1 monitor
(3, 4, 1),  -- Clara comprou 1 cadeira gamer
(4, 2, 3);  -- Diego comprou 3 mouses
/*
Uma subquery ou subconsulta,é literalmente uma consulta dentro de outra
retornar dados intermédiarios que serão usados pela consulta principal
*/
select * from clientes;
select * from produtos;
select * from pedidos;
select * from itens_pedidido;

-- liste os produtos com o preço acima da médias dos preços de todos os produtos
select nome,preco
from produtos
where preco>(select avg(preco) from produtos);

-- liste o nome dos clientes que fizeram pedidos.alter
select nome
from clientes
where id not in (select id_cliente from pedidos);

-- subquery no from(Subconsulta como tabela)
-- Liste a médias de preço e a qunatidade total vendida. Usar uma subquery

select p.nome,sub.total_vendido
from(
select id_produto,sum(quantidade) as total_vendido
from itens_pedido
group by id_produto
) as sub
join produtos p on p.id=sub.id_produto;