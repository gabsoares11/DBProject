


-- OK
-- Questão 1
-- Crie uma view que lista as agências inanciadoras que financiaram projetos que iniciaram entre 2007 e 2015
CREATE VIEW ListaAgencia(nomeA) AS
  SELECT DISTINCT A.nome
  FROM agencia_financiadora A, projeto P, agencia_projeto AP
  WHERE P.dt_inicio BETWEEN '2007-01-01' AND '2015-31-12' AND
        AP.cod_agencia = A.codigo AND
        AP.cod_projeto = P.codigo



-- Questão 2
--Liste a quantidade de alunos de doutorado que possuem bolsa, por Linha de Pesquisa
SELECT COUNT(*) as Quantidade de alunos
FROM aluno
WHERE LOWER(nivel) LIKE '%doutorado%' AND 
      cod_cnpq IS NOT NULL AND 
      cod_sub_cnpq IS NOT NULL 



-- OK
-- Questão 3
-- Crie uma view que lista os laboratórios que executam projetos iniciados em 2008
CREATE VIEW ListaLaboratorios(nomeL) AS
  SELECT DISTINCT L.nome
  FROM laboratorio L, projeto P, laboratorio_projeto LP
  WHERE P.dt_inicio >= '2008-01-01'
        LP.cod_projeto = P.codigo AND
        LP.cod_laboratorio = L.codigo



--Questão 4
-- Quais os alunos que de doutorado nasceram entre 1975 e 1990 e participaram de alguma publicação em 2014?
SELECT DISTINCT A.nome
FROM alunos A, publicacao P, aluno_publicacao AP
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      A.dt_nasc BETWEEN '1975-01-01' AND '1990-31-12' AND
      P.ano = 2014



-- OK
-- Questão 5
-- Quais os projetos que iniciaram antes de 2014 e possuem um orçamento entre R$ 550.000 e R$ 780.000?
SELECT titulo
FROM projeto 
WHERE dt_inicio < '2014-01-01' AND
      orcamento BETWEEN 550.00 AND 780.00




-- Questão 6
-- Quais professores que participaram de todas as publicações?
SELECT PR.nome
FROM publicacoes PU, professor PR
GROUP BY PR.nome
HAVING COUNT(*) >= ALL
                (SELECT COUNT(*)
                 FROM publicacoes PU, professor PR)



-- OK
-- Questão 7
-- Quais agências financiadoras que financiam bolsas menores que R$2000 para alunos de mestrado?
SELECT A.nome
FROM agencia_financiadora AG, aluno AL
WHERE LOWER(A.nivel) LIKE '%mestrado%' AND 
      AL.cod_agencia = AG.codigo AND
      AL.valor_bolsa < 2000



-- Questão 8
-- Liste os departamentos que são gerenciados por professores que nasceram em 1990 e orientam mais de um aluno de mestrado
SELECT DISTINCT D.nome
FROM departamento D, professor P, aluno A
WHERE P.cod_departamento = D.codigo AND
      P.dt_nasc BETWEEN '1990-01-01' AND '1990-31-12' AND
      -- ORIENTAM MAIS DE UM ALUNO DE MESTRADO


-- Questão 9
--Qual publicação possui mais alunos como autores?
SELECT P.titulo
FROM publicacao P, aluno A



-- Questão 10
-- Liste a quantidade de alunos de mestrado financiados por agência financiadora, exiba todos os dados da agência, inclua as agências que não financiam nenhum aluno mestrado
SELECT COUNT(A.matricula)
FROM alunos AL, agencia_financiadora AF



-- OK
-- Questão 11
-- Quais os alunos de doutorado que participaram de alguma publicação em 2012?
SELECT DISTINCT A.nome
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE LOWER(A.nivel) LIKE '%doutorado%' AND 
      AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND
      P.ano = 2012



-- Questão 12
-- Liste a quantidade de publicações em 2013 que não tem a participação de nenhum aluno de graduação
SELECT COUNT(*)
FROM publicacao P,  aluno_publicacao AP
WHERE ano = 2013 AND
      AP.mat_aluno IS NULL



-- OK
-- Questão 13
-- Qual a soma dos orçamentos dos projetos que encerraram em 2008
SELECT SUM(orcamento)
FROM projeto
WHERE dt_fim BETWEEN '2008-01-01' AND '2008-31-12'



-- OK
-- Questão 14
-- Liste o nível e o nome dos alunos que participaram de publicações depois de 2006
SELECT A.nivel, A.nome 
FROM aluno A, publicacao P, aluno_publicacao AP
WHERE AP.mat_aluno = A.matricula AND
      AP.cod_publicacao = P.codigo AND 
      P.ano > 2006



-- Questão 15
-- Crie um trigger para toda vez que uma nova patente for inserida, incremente a coluna premiação (que deve ser colocada com valor ZERO para cada projeto cadastrado) na tabela de projetos


-- Questão 16
-- Crie um trigger que não permita a atualização da descrição de uma patente
