-- Banco de Dados I - Projeto parte 3 
-- Consultas SQL 
-- GRUPO: Gabryelle Soares
--        Larissa Gabriela
--        Yally Galdino

 
-- ok - 1, 3, 4, 5, 6, 7, 14
-- dúvida - 2 (listar por linha de pesquisa)
--          8 (orienta mais de um)
-- falta fzr - 9, 10
-- falta testar - 11, 12, 13, 15, 16


-- OK
-- Questão 1
-- Crie uma view que lista as agências financiadoras que financiaram projetos que iniciaram entre 2007 e 2015
CREATE VIEW Agencias AS
  SELECT DISTINCT AF.*
  FROM agencia_financiadora AF, agencia_projeto AP, projeto P
  WHERE AP.cod_agencia = AF.codigo AND 
        AP.cod_projeto = P.codigo AND 
        P.dt_inicio BETWEEN '01-01-2007' AND '12-31-2015';


-- dúvida
-- Questão 2
-- Liste a quantidade de alunos de doutorado que possuem bolsa, por Linha de Pesquisa
SELECT COUNT(*)
FROM aluno
WHERE LOWER(nivel) LIKE '%doutorado%' AND 
      cod_cnpq IS NOT NULL AND 
      cod_sub_cnpq IS NOT NULL AND 
      valor_bolsa > 1;


-- OK
-- Questão 3
-- Crie uma view que lista os laboratórios que executam projetos iniciados em 2008
CREATE VIEW Laboratorios AS
  SELECT L.*
  FROM laboratorio_projeto LP, laboratorio L, projeto P
  WHERE P.dt_inicio BETWEEN '01-01-2008' AND '12-31-2008' AND
        LP.cod_projeto = P.codigo AND
        LP.cod_laboratorio = L.codigo;


-- OK
-- Questão 4
-- Quais os alunos que de doutorado nasceram entre 1975 e 1990 e participaram de alguma publicação em 2014?
SELECT A.nome
FROM aluno_publicacao AP, aluno A, publicacao P
WHERE A.dt_nasc BETWEEN '01-01-1975' AND '12-31-1990' AND 
      LOWER(A.nivel) LIKE '%doutorado%' AND 
      A.matricula = AP.mat_aluno AND 
      P.codigo = AP.cod_publicacao AND 
      P.ano = 2014;


-- OK
-- Questão 5
-- Quais os projetos que iniciaram antes de 2014 e possuem um orçamento entre R$ 550.000 e R$ 780.000?
SELECT codigo, descricao
FROM projeto
WHERE dt_inicio < '01-01-2014' AND 
      orcamento BETWEEN '550000.00' AND '780000.00';


-- OK
-- Questão 6
-- Quais professores que participaram de todas as publicações?
SELECT PR.nome
FROM professor PR, publicacao PU
WHERE PR.matricula = PU.mat_professor
GROUP BY PR.nome
HAVING COUNT(*) >= ALL (SELECT COUNT(*)                  
                  FROM publicacao PU, professor PR                     
                  WHERE PU.mat_professor = PR.matricula);		
		

-- OK
-- Questão 7
-- Quais agências financiadoras que financiam bolsas menores que R$2000 para alunos de mestrado?
SELECT AF.*
FROM agencia_financiadora AF, aluno A
WHERE LOWER(A.nivel) LIKE '%mestrado%' AND 
      A.cod_agencia = AF.codigo AND
      A.valor_bolsa < 2000;


-- dúvida
-- Questão 8
-- Liste os departamentos que são gerenciados por professores que nasceram em 1990 e orientam mais de um aluno de mestrado
SELECT DISTINCT D.nome
FROM departamento D, professor P, aluno A
WHERE LOWER(A.nivel) = '%mestrado%' AND
      A.mat_professor = P.matricula
      P.cod_departamento = D.codigo AND
      P.dt_nasc BETWEEN '01-01-1990' AND '12-31-1990';
      -- ORIENTAM MAIS DE UM ALUNO DE MESTRADO


-- falta fzr
-- Questão 9
-- Qual publicação possui mais alunos como autores?
SELECT P.titulo
FROM publicacao P, aluno A;


-- falta fzr
-- Questão 10
-- Liste a quantidade de alunos de mestrado financiados por agência financiadora, exiba todos os dados da agência, inclua as agências que não financiam nenhum aluno mestrado
SELECT COUNT(*)
FROM alunos AL, agencia_financiadora AF;


-- falta testar
-- Questão 11
-- Quais os alunos de doutorado que participaram de alguma publicação em 2012?
SELECT A.matricula, A.nome
FROM aluno_publicacao AP, aluno A, publicacao P
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      P.ano = 2012;


-- falta testar
-- Questão 12
-- Liste a quantidade de publicações em 2013 que não tem a participação de nenhum aluno de graduação
SELECT COUNT(*)
FROM publicacao P,  aluno_publicacao AP
WHERE P.ano = 2013 AND
      AP.cod_publicacao = P.codigo AND
      AP.mat_aluno IS NULL;


-- falta testar
-- Questão 13
-- Qual a soma dos orçamentos dos projetos que encerraram em 2008
SELECT SUM(orcamento)
FROM projeto
WHERE dt_fim BETWEEN '01-01-2008' AND '12-31-2008';


-- OK
-- Questão 14
-- Liste o nível e o nome dos alunos que participaram de publicações depois de 2006
SELECT DISTINCT A.nome, A.nivel 
FROM aluno_publicacao AP, aluno A, publicacao P
WHERE AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND 
      P.ano > 2006;


-- falta testar
-- Questão 15
-- Crie um trigger para toda vez que uma nova patente for inserida, incremente a coluna 
-- premiação (que deve ser colocada com valor ZERO para cada projeto cadastrado) na tabela de projetos
CREATE or REPLACE TRIGGER premiacao_after_insert
AFTER INSERT
	ON projeto
	FOR EACH ROW
DECLARE
	premios int;

BEGIN
	-- Encontra codigos dos projetos com patente
	SELECT COUNT(*) INTO premios
	FROM projeto P, patente PAT
	WHERE P.codigo = PAT.cod_projeto
	GROUP BY PAT.cod_projeto;

	-- Modifica o valor de
  UPDATE projeto SET premiacao = premios;

END;


-- falta testar
-- Questão 16
-- Crie um trigger que não permita a atualização da descrição de uma patente
CREATE or REPLACE TRIGGER not_update		
 BEFORE INSERT OR UPDATE		
 	ON PETENTE		
 	FOR EACH ROW		
   WHEN(descricao)		
 DECLARE		
 BEGIN		
   IF :new.dt_inicio > :new.dt_fim		
      Then		
        RAISE_APPLICATION_ERROR(-20001,'DT_INICIO INVALIDO');		
   END IF;		
 END;  


SELECT AF.nome
FROM agencia_financiadora AF, agencia_projeto AP, projeto P
WHERE AP.cod_agencia = AF.codigo AND AP.cod_projeto = P.codigo AND P.dt_inicio BETWEEN '01-01-2007' AND '12-31-2015';