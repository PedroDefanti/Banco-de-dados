CREATE DATABASE universidade;
USE universidade;
/*3-TABELAS
1- ALUNOS
2-CURSOS
3-MATRICULA(ID_ALUNOS, ID_CURSO)
*/
CREATE TABLE alunos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
data_nascimento date NOT NULL
);

CREATE TABLE cursos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(90) NOT NULL,
carga_horaria INT NOT NULL
);
CREATE TABLE matriculas(
id INT AUTO_INCREMENT PRIMARY KEY,
id_aluno INT,
id_curso INT,
data_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (id_aluno) REFERENCES alunos(id),
 FOREIGN KEY (id_curso) REFERENCES cursos(id)
 );
 
 /*INSERIR 5 NOMES EM ALUNOS 
 INSERIR 4 CURSOS
 ENGENHARIA DE SOFTWARE
 */
 INSERT INTO alunos(nome,email,data_nascimento)
 values
 ('PEDRO','gfhyirsbiylb@vbdyksgvhfsg','2024-06-05'),
 ('ANA','gfhyirsbiylb@vbdyksgvhfsg','2024-06-05'),
 ('BRENO','gfhyirsbiylb@vbdyksgvhfsg','2024-06-05'),
 ('CARLA','gfhyirsbiylb@vbdyksgvhfsg','2024-06-05'),
 ('AAAAAAA','gfhyirsbiylb@vbdyksgvhfsg','2024-06-05'),
 ('BBBBBBBBB','gfhyirsbiylb@vbdyksgvhfsg','2024-06-05');
 SELECT * FROM alunos;
 
 INSERT INTO cursos(nome,carga_horaria)
 values
 ('Engenharia de software',4500),
 ('Engenharia civil',2500),
 ('Administrição',1500),
 ('Pedagogia',2000);
 select * from cursos;
 
 SELECT * FROM matriculas;
 INSERT INTO matriculas (id_aluno,id_curso)
 VALUES
 (2,2),
 (2,4),
 (1,2),
 (1,3);
 
 /*=================================================================================*/
 -- FUNÇOES VÃO AJUDAR A REALIZAR OPERAÇÕES DE FORMA SIMPLES E RÁPIDA
-- COUNT->  CONTAR ELEMENTOS
SELECT * FROM alunos;
SELECT COUNT(*) AS 'tOTAL DE ALUNOS'
FROM alunos;
SELECT COUNT(nome) as 'total de cursos'
FROM cursos; 

-- FUNÇAO MIN - MENOR VALOR
-- Retornar  o aluno mais velho
SELECT MIN(data_nascimento)  'ALUNO MAIS VELHO'
FROM alunos;
SELECT MIN(id) AS 'MENOR ID'
FROM alunos;
SELECT MAX(id) AS 'MAIOR ID'
FROM alunos;
SELECT MIN(carga_horaria) as 'MENOR CARGA HORARIA'
FROM cursos;


-- MEDIA -> CARGA HORARIA -> CURSOS
SELECT AVG(carga_horaria) AS 'MEDIAS DAS CARGAS HORARIAS DOS CURSOS'
FROM cursos;


-- SOMA -> CARGA HORARIA -> CURSOS
SELECT SUM(carga_horaria) AS 'SOMA DAS CRAGAS HORARIAS'
FROM cursos; 

-- between,IN,LIKE
-- QUERO SELECIONAR AS CARGAS HORARIAS TANTO A TANTO
 SELECT nome,carga_horaria
 from cursos
 where carga_horaria between 2000 AND 4500;
 
 SELECT id,nome
 FROM alunos
 WHERE id IN(1,2,3);
 
 
 -- LIKE
 -- FILTRAR POR ESPECIAFICAÇÕES(NOMES QUE COMECEM COM A LETRA SELECIONA )
SELECT id,nome
FROM alunos
WHERE NOME LIKE 'A%';


 -- FILTRAR POR ESPECIAFICAÇÕES(NOMES QUE TERMINAM COM A LETRA SELECIONADA)
SELECT id,nome
FROM alunos
WHERE NOME LIKE '%A';


/* DATA 18/09/2025
CREATE DATABASE universidade;
USE universidade;
/*3-TABELAS
1- ALUNOS
2-CURSOS
3-MATRICULA(ID_ALUNOS, ID_CURSO)
*/
CREATE TABLE alunos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
data_nascimento date NOT NULL
);
SHOW TABLES;
CREATE TABLE cursos(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(90) NOT NULL,
carga_horaria INT NOT NULL
);
CREATE TABLE matriculas(
id INT AUTO_INCREMENT PRIMARY KEY,
id_aluno INT,
id_curso INT,
data_matricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (id_aluno) REFERENCES alunos(id),
 FOREIGN KEY (id_curso) REFERENCES cursos(id)
 );
 DROP TABLE matriculas;
 
 /*INSERIR 5 NOMES EM ALUNOS 
 INSERIR 4 CURSOS
 ENGENHARIA DE SOFTWARE
 */
 INSERT INTO alunos(nome,email,data_nascimento)
 values
 ('PEDRO','gfhyirsbiylb@vbdyksgvhfsg','1995-06-05'),
 ('ANA','gfhyirsbiylb@vbdyksgvhfsg','1996-06-05'),
 ('BRENO','gfhyirsbiylb@vbdyksgvhfsg','1997-06-05'),
 ('CARLA','gfhyirsbiylb@vbdyksgvhfsg','2000-06-05'),
 ('AAAAAAA','gfhyirsbiylb@vbdyksgvhfsg','1998-06-05'),
 ('BBBBBBBBB','gfhyirsbiylb@vbdyksgvhfsg','1999-06-05');
 SELECT * FROM alunos;
 
 INSERT INTO cursos(nome,carga_horaria)
 values
 ('Engenharia de software',4500),
 ('Engenharia civil',2500),
 ('Administrição',1500),
 ('Pedagogia',2000);
 select * from cursos;
 
 SELECT * FROM matriculas;
 INSERT INTO matriculas (id_aluno,id_curso)
 VALUES
 (2,2),
 (2,4),
 (1,2),
 (1,3);
 
 /*=================================================================================*/
 -- FUNÇOES VÃO AJUDAR A REALIZAR OPERAÇÕES DE FORMA SIMPLES E RÁPIDA
-- COUNT->  CONTAR ELEMENTOS
SELECT * FROM alunos;
SELECT COUNT(*) AS 'tOTAL DE ALUNOS'
FROM alunos;
SELECT COUNT(nome) as 'total de cursos'
FROM cursos; 

-- FUNÇAO MIN - MENOR VALOR
-- Retornar  o aluno mais velho
SELECT MIN(data_nascimento)  'ALUNO MAIS VELHO'
FROM alunos;
SELECT MIN(id) AS 'MENOR ID'
FROM alunos;
SELECT MAX(id) AS 'MAIOR ID'
FROM alunos;
SELECT MIN(carga_horaria) as 'MENOR CARGA HORARIA'
FROM cursos;


-- MEDIA -> CARGA HORARIA -> CURSOS
SELECT AVG(carga_horaria) AS 'MEDIAS DAS CARGAS HORARIAS DOS CURSOS'
FROM cursos;


-- SOMA -> CARGA HORARIA -> CURSOS
SELECT SUM(carga_horaria) AS 'SOMA DAS CRAGAS HORARIAS'
FROM cursos; 

-- between,IN,LIKE
-- QUERO SELECIONAR AS CARGAS HORARIAS TANTO A TANTO
 SELECT nome,carga_horaria
 from cursos
 where carga_horaria between 2000 AND 4500;
 
 SELECT id,nome
 FROM alunos
 WHERE id IN(1,2,3);
 
 
 -- LIKE
 -- FILTRAR POR ESPECIAFICAÇÕES(NOMES QUE COMECEM COM A LETRA SELECIONA )
SELECT id,nome
FROM alunos
WHERE NOME LIKE 'A%';


 -- FILTRAR POR ESPECIAFICAÇÕES(NOMES QUE TERMINAM COM A LETRA SELECIONADA)
SELECT id,nome
FROM alunos
WHERE NOME LIKE '%A';


-- AULA 18/09/2025
-- GROUP BY agrupar registros de acordo com um ou mais campos
SELECT * FROM alunos;
SELECT YEAR(data_nascimento) AS 'Ano de Nascimento',
COUNT(*) AS 'QUANTIDADE DE ALUNOS POR ANO'
FROM alunos
GROUP BY YEAR(data_nascimento)
HAVING COUNT(*)>=2
ORDER BY YEAR(data_nascimento);
DROP TABLE alunos;
-- contagem dos alunos depois de 1995

SELECT YEAR(data_nascimento) AS ano,COUNT(*) Quantidade
FROM alunos
WHERE YEAR(data_nascimento)>1995
GROUP BY(data_nascimento)
HAVING COUNT(*)>=2;

-- consulta com ORDER BY
/*
HAVING X WHERE

WHERE: FILTRAR LINHAS ANTES DE AGRUPAR
HAVING: FILTRAR APOS O AGRUPAMENTO
*/



-- ALUNOS NASCIDOS ENTRE 1995-2000
-- YEAR E BETWEEN
SELECT YEAR(data_nascimento)
FROM alunos
WHERE data_nascimento BETWEEN '1995-01-01' AND '2000-12-31';
-- WHERE YEAR (data_nascimento) BETWEEN 1995 AND 2000;


-- AGRUPAR TODOS OS REGISTROS DE MATRICULAS POR CURSOS E MOSTRAR QUANTOS ALUNOS CADA CURSO TEM
SELECT * FROM matriculas;
SELECT id_curso, COUNT(*)
FROM  matriculas
GROUP BY id_curso;
/*JOINS
os joins permitem unir dados de duas ou + tabelas
(relacoinadas),atráves das chaves primárias e das chaves entrangeiras.
essas chaves são fundamentais pra esse processo
aluno pk(id)
curso pk(id)
matriculas fk(id_aluno,id_curso)
*/
SELECT * FROM alunos;
SELECT * FROM cursos AS 'AAAAAAAAAAAAAAAAAAAAAAAAAAAA';
SELECT * FROM matriculas;

-- TIPOS DE JOIN
-- INNER JOIN
/*
TRAZ APENAS OS REGISTROS QUE TEM CORRESPONDECIAS EM AMBAS AS TABELAS,TRAZER ALUNOS COM SEUS CURSOS
*/
SELECT
alunos.nome,
alunos.data_nascimento,
cursos.nome,
matriculas.data_matricula
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.id_aluno
INNER JOIN cursos ON cursos.id = matriculas.id_curso;
SELECT * FROM matriculas;


-- INNER JOIN ALIAS
SELECT
a.nome,
a.data_nascimento,
c.nome,
m.data_matricula
FROM alunos a
INNER JOIN matriculas m ON a.id = m.id_aluno
INNER JOIN cursos c ON c.id = m.id_curso;
distinct: seleciona as cidades distintas apenas uma vez
*/











 
 