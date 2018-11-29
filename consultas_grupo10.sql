
-- Questão 1
-- Crie uma view que lista as agências inanciadoras que financiaram projetos que iniciaram entre 2007 e 2015
CREATE VIEW ListaAgencia(nomeA) AS
  SELECT A.nome
  FROM agencia_financiadora A, projeto P, agencia_projeto AP
  WHERE P.dt_inicio BETWEEN '2007-01-01' AND '2015-31-12' AND
        AP.cod_agencia = A.codigo AND
        AP.cod_projeto = P.codigo



-- ERRADO
-- Questão 2
--Liste a quantidade de alunos de doutorado que possuem bolsa, por Linha de Pesquisa
SELECT COUNT(*) as Quantidade de alunos
FROM aluno
WHERE LOWER(nivel) LIKE '%doutorado%' AND 
      cod_cnpq IS NOT NULL AND 
      cod_sub_cnpq IS NOT NULL 



-- Questão 3
-- Crie uma view que lista os laboratórios que executam projetos iniciados em 2008
CREATE VIEW ListaLaboratorios(nomeL) AS
  SELECT L.nome
  FROM laboratorio L, projeto P, laboratorio_projeto LP
  WHERE P.dt_inicio BETWEEN '2008-01-01' AND '2018-29-11' AND 
        LP.cod_projeto = P.codigo AND
        LP.cod_laboratorio = L.codigo



--Questão 4
-- Quais os alunos que de doutorado nasceram entre 1975 e 1990 e participaram de alguma publicação em 2014?
SELECT A.nome
FROM alunos A, publicacao P, aluno_publicacao AP
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      A.dt_nasc BETWEEN '1975-01-01' AND '1990-31-12' AND
      P.ano = 2014



-- Questão 5
-- Quais os projetos que iniciaram antes de 2014 e possuem um orçamento entre R$ 550.000 e R$ 780.000?
SELECT titulo
FROM projeto 
WHERE dt_inicio < '2014-01-01' AND
      orcamento BETWEEN 550.00 AND 780.00



-- NÃO SEI 
-- Questão 6
-- Quais professores que participaram de todas as publicações?
SELECT PR.nome
FROM publicacoes PU, professor PR
GROUP BY PR.nome
HAVING COUNT(*) >= ALL
                (SELECT COUNT(*)
                 FROM publicacoes PU, professor PR)



-- Questão 7
-- Quais agências financiadoras que financiam bolsas menores que R$2000 para alunos de mestrado?
SELECT A.nome
FROM agencia_financiadora AG, aluno AL
WHERE LOWER(A.nivel) LIKE '%mestrado%' AND 
      AL.cod_agencia = AG.codigo AND
      AL.valor_bolsa < 2000



-- Questão 8
-- Liste os departamentos que são gerenciados por professores que nasceram em 1990 e orientam mais de um aluno de mestrado
SELECT 


-- Questão 9


-- Questão 10


-- Questão 11
-- Quais os alunos de doutorado que participaram de alguma publicação em 2012?
SELECT A.nome
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      P.ano = 2012



-- Questão 12



-- Questão 13
-- Qual a soma dos orçamentos dos projetos que encerraram em 2008
SELECT SUM(orcamento)
FROM projeto
WHERE dt_fim <= '2008-31-12'



-- Questão 14
-- Liste o nível e o nome dos alunos que participaram de publicações depois de 2006
SELECT A.nivel, A.nome 
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND 
      P.ano > 2006



-- Questão 15



-- Questão 16
