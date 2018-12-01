-- Banco de Dados I - Projeto parte 3 
-- Consultas SQL 

--OBS: 
-- OK - 1,2,3,4,5,7,11,13,14,15
--falta-6,8,9,10,12,16
--- questao nao sei - 6,9,10,16
--- questao 8 incompleta
--- duvida da 12 mas ta feita





-- Questão 1
-- Crie uma view que lista as agências inanciadoras que financiaram projetos que iniciaram entre 2007 e 2015
CREATE VIEW Agencias AS
  SELECT A.*
  FROM agencia_financiadora A, projeto P, agencia_projeto AP
  WHERE P.dt_inicio < TO_DATE('2016-01-01', 'YYYY/MM/DD') AND
        P.dt_inicio >= TO_DATE('2007-01-01', 'YYYY/MM/DD') AND
        AP.cod_agencia = A.codigo AND
        AP.cod_projeto = P.codigo



-- Questão 2
--Liste a quantidade de alunos de doutorado que possuem bolsa, por Linha de Pesquisa
SELECT COUNT(*)
FROM aluno A
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      A.cod_cnpq IS NOT NULL AND 
      A.cod_sub_cnpq IS NOT NULL 




-- Questão 3
-- Crie uma view que lista os laboratórios que executam projetos iniciados em 2008
CREATE VIEW Laboratorios AS
  SELECT L.*
  FROM laboratorio L, projeto P, laboratorio_projeto LP
  WHERE P.dt_inicio >= TO_DATE('2008-01-01','YYYY/MM/DD')
        LP.cod_projeto = P.codigo AND
        LP.cod_laboratorio = L.codigo



--Questão 4
-- Quais os alunos que de doutorado nasceram entre 1975 e 1990 e participaram de alguma publicação em 2014?
SELECT A.nome
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      A.dt_nasc >= TO_DATE('1975-01-01','YYYY/MM/DD') AND 
      A.dt_nasc <  TO_DATE('1991-01-01','YYYY/MM/DD') AND
      P.ano = 2014





-- Questão 5
-- Quais os projetos que iniciaram antes de 2014 e possuem um orçamento entre R$ 550.000 e R$ 780.000?
SELECT codigo
FROM projeto 
WHERE dt_inicio < TO_DATE('2014-01-01','YYYY/MM/DD') AND
      orcamento >= 550000.00 AND
      orcamento <= 780000.00







-- Questão 6
-- Quais professores que participaram de todas as publicações?
SELECT 
FROM 
GROUP BY 
HAVING COUNT(*) >= ALL
                (SELECT COUNT(*)
                 FROM 
                 GROUP BY )




-- Questão 7
-- Quais agências financiadoras que financiam bolsas menores que R$2000 para alunos de mestrado?
SELECT AG.*
FROM agencia_financiadora AG, aluno AL
WHERE LOWER(AG.nivel) LIKE '%mestrado%' AND 
      AL.cod_agencia = AG.codigo AND
      AL.valor_bolsa < 2000



-- Questão 8
-- Liste os departamentos que são gerenciados por professores que nasceram em 1990 e orientam mais de um aluno de mestrado
SELECT DISTINCT D.nome
FROM departamento D, professor P, aluno A
WHERE P.cod_departamento = D.codigo AND
      P.dt_nasc >= TO_DATE('1990-01-01','YYYY/MM/DD') AND
      P.dt_nasc < TO_DATE('1991-01-01','YYYY/MM/DD')
      -- ORIENTAM MAIS DE UM ALUNO DE MESTRADO


-- Questão 9
--Qual publicação possui mais alunos como autores?
SELECT P.titulo
FROM publicacao P, aluno A



-- Questão 10
-- Liste a quantidade de alunos de mestrado financiados por agência financiadora, exiba todos os dados da agência, inclua as agências que não financiam nenhum aluno mestrado
SELECT COUNT(*)
FROM alunos AL, agencia_financiadora AF




-- Questão 11
-- Quais os alunos de doutorado que participaram de alguma publicação em 2012?
SELECT A.*
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      P.ano = 2012



-- Questão 12
-- Liste a quantidade de publicações em 2013 que não tem a participação de nenhum aluno de graduação
SELECT COUNT(*)
FROM publicacao P,  aluno_publicacao AP
WHERE P.ano = 2013 AND
      AP.cod_publicacao = P.codigo AND
      AP.mat_aluno IS NULL




-- Questão 13
-- Qual a soma dos orçamentos dos projetos que encerraram em 2008
SELECT SUM(orcamento)
FROM projeto
WHERE dt_fim >= TO_DATE('2008-01-01','YYYY/MM/DD') AND
      dt_fim < TO_DATE('2009-01-01','YYYY/MM/DD')



-- Questão 14
-- Liste o nível e o nome dos alunos que participaram de publicações depois de 2006
SELECT A.nivel, A.nome 
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND 
      P.ano > 2006



-- Questão 15
-- Crie um trigger para toda vez que uma nova patente for inserida, incremente a coluna premiação (que deve ser colocada com valor ZERO para cada projeto cadastrado) na tabela de projetos
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


-- Questão 16
-- Crie um trigger que não permita a atualização da descrição de uma patente
