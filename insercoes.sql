INSERT INTO departamento VALUES (1, 'computação', 'rua do dep. 1', NULL);
INSERT INTO departamento VALUES (2, 'estatística', 'rua do dep. 2', NULL);
INSERT INTO departamento VALUES (3, 'departamento 3', 'rua do dept. 3', NULL);


INSERT INTO departamento_telefone VALUES (1, '99999-9999');
INSERT INTO departamento_telefone VALUES (2, '99999-9999');


INSERT INTO professor VALUES (1, 'claudio', 'phd', 1, '08-30-1965');
INSERT INTO professor VALUES (2, 'amanda', 'mestrado', 2, '09-04-1970');
INSERT INTO professor VALUES (3, 'joao', 'doutorado', 1, '04-24-1983');
INSERT INTO professor VALUES (4, 'joseana', 'mestrado', 1, '08-30-1990');
INSERT INTO professor VALUES (5, 'dalton', 'mestrado', 1, '01-19-1990');


UPDATE departamento SET mat_professor=1 WHERE codigo=1;
UPDATE departamento SET mat_professor=2 WHERE codigo=2;
UPDATE departamento SET mat_professor=4 WHERE codigo=3;


INSERT INTO agencia_financiadora VALUES (100, 'agencia1', 'agencia1@email.com', 'agencia1 address');
INSERT INTO agencia_financiadora VALUES (200, 'agencia2', 'agencia2@email.com', 'agencia2 address');


INSERT INTO projeto VALUES (1, 1, 185000, 'projeto 1', 'descricao do projeto 1', '01-01-2007', '05-28-2017', 4);
INSERT INTO projeto VALUES (2, 2, 4000.00, 'projeto 2', 'descricao do projeto 2', '03-22-2009', NULL, 3);
INSERT INTO projeto VALUES (3, 1, 12000.00, 'projeto 3', 'descricao do projeto 3', '04-13-2016', NULL, 1);
INSERT INTO projeto VALUES (4, 2, 5700.00, 'projeto 4', 'descricao do projeto 4', '12-31-2015', NULL, 2);
INSERT INTO projeto VALUES (5, 3, 10000.00, 'projeto 5', 'descricao do projeto 5', '02-15-2008', NULL, 4);
INSERT INTO projeto VALUES (6, 3, 550000.00, 'projeto 6', 'descricao do projeto 6', '04-29-2013', NULL, 2);
INSERT INTO projeto VALUES (7, 3, 550000.00, 'projeto 7', 'descricao do projeto 7', '08-13-2014', NULL, 1);
INSERT INTO projeto VALUES (8, 2, 780000.00, 'projeto 8', 'descricao do projeto 8', '02-20-2012', '07-30-2017', 2);
INSERT INTO projeto VALUES (9, 1, 685000.00, 'projeto 9', 'descricao do projeto 9', '07-05-2013', '05-12-2018', 2);
INSERT INTO projeto VALUES (10, 1, 700000.00, 'projeto 10', 'descricao do projeto 10', '11-03-2007', '07-08-2008', 1);
INSERT INTO projeto VALUES (11, 1, 300000.00, 'projeto 11', 'descricao do projeto 11', '07-16-2005', '01-30-2008', 1);


INSERT INTO agencia_projeto VALUES (100, 1);
INSERT INTO agencia_projeto VALUES (200, 2);
INSERT INTO agencia_projeto VALUES (100, 3);
INSERT INTO agencia_projeto VALUES (200, 4);


INSERT INTO professor_projeto VALUES (1, 1);
INSERT INTO professor_projeto VALUES (3, 5);


INSERT INTO linha_de_pesquisa VALUES (101, 201, 'area 1', 'subarea 1');
INSERT INTO linha_de_pesquisa VALUES (102, 202, 'area 2', 'subarea 2');


INSERT INTO pesquisa_projeto VALUES (101, 201, 1);
INSERT INTO pesquisa_projeto VALUES (102, 202, 2);


INSERT INTO aluno VALUES (1001, 'aluno 1', 'mestrado', 1, 1, 101, 201, '04-06-1979', 100, 2000.00, '01-01-2007', '05-28-2017', 20);
INSERT INTO aluno VALUES (1002, 'aluno 2', 'doutorado', 1, 1, 101, 201, '07-28-1983', 100, 1570.00, '01-01-2007', '05-28-2017', 18);
INSERT INTO aluno VALUES (1003, 'aluno 3', 'doutorado', 2, 2, 102, 202, '02-14-1982', 200, 1200.00, '03-22-2009', NULL, 12);
INSERT INTO aluno VALUES (1004, 'aluno 4', 'doutorado', 2, 2, 102, 202, '05-17-1985', 200, 1200.00, '03-22-2009', NULL, 12);
INSERT INTO aluno VALUES (1005, 'aluno 5', 'doutorado', 1, 1, 101, 201, '12-05-1987', 100, NULL, '06-08-2013', '05-28-2017', 20);
INSERT INTO aluno VALUES (1006, 'aluno 6', 'graduação', 2, 2, 102, 202, '11-30-1988', 200, NULL, '07-01-2008', NULL, 15);
INSERT INTO aluno VALUES (1007, 'aluno 7', 'mestrado', 4, NULL, NULL, NULL, '10-27-1994', NULL, NULL, NULL, NULL, NULL);
INSERT INTO aluno VALUES (1008, 'aluno 8', 'mestrado', 5, NULL, NULL, NULL, '08-09-1999', NULL, NULL, NULL, NULL, NULL);
INSERT INTO aluno VALUES (1009, 'aluno 9', 'mestrado', 5, NULL, NULL, NULL, '08-15-1997', NULL, NULL, NULL, NULL, NULL);
INSERT INTO aluno VALUES (1010, 'aluno 10', 'mestrado', 4, NULL, NULL, NULL, '02-09-1997', NULL, NULL, NULL, NULL, NULL);


INSERT INTO laboratorio VALUES (1100, 'laboratorio 1', 'local do lab 1', 1);
INSERT INTO laboratorio VALUES (2200, 'laboratorio 2', 'local do lab 2', 3);


INSERT INTO laboratorio_projeto VALUES (1100, 3);
INSERT INTO laboratorio_projeto VALUES (2200, 5);


INSERT INTO publicacao VALUES (1001, 'publicacao 1', 'veiculo 1', 2005, 1, 3);
INSERT INTO publicacao VALUES (2002, 'publicacao 2', 'veiculo 2', 2014, 5, 3);
INSERT INTO publicacao VALUES (3003, 'publicacao 3', 'veiculo 3', 2012, 6, 3);
INSERT INTO publicacao VALUES (4004, 'publicacao 4', 'veiculo 4', 2015, 7, 3);
INSERT INTO publicacao VALUES (5005, 'publicacao 5', 'veiculo 5', 2016, 3, 2);
INSERT INTO publicacao VALUES (6006, 'publicacao 6', 'veiculo 6', 2013, 3, 2);
INSERT INTO publicacao VALUES (7007, 'publicacao 7', 'veiculo 7', 2013, 3, 2);
INSERT INTO publicacao VALUES (8008, 'publicacao 8', 'veiculo 8', 2013, 5, 3);


INSERT INTO aluno_publicacao VALUES (1001, 1001);
INSERT INTO aluno_publicacao VALUES (1002, 2002);
INSERT INTO aluno_publicacao VALUES (1003, 2002);
INSERT INTO aluno_publicacao VALUES (1006, 2002);
INSERT INTO aluno_publicacao VALUES (1002, 3003);
INSERT INTO aluno_publicacao VALUES (1003, 3003);
INSERT INTO aluno_publicacao VALUES (1010, 4004);
INSERT INTO aluno_publicacao VALUES (1009, 7007);
INSERT INTO aluno_publicacao VALUES (1006, 7007);
INSERT INTO aluno_publicacao VALUES (1001, 6006);
INSERT INTO aluno_publicacao VALUES (1006, 8008);


SELECT COUNT(DISTINCT P.titulo), P.titulo
FROM aluno_publicacao AP, aluno A, publicacao P
WHERE P.ano = 2013 AND
      AP.cod_publicacao = P.codigo AND
      AP.mat_aluno = A.matricula AND
      LOWER(A.nivel) LIKE '%gradua%'
GROUP BY P.titulo;




(SELECT COUNT(*) FROM departamento D, professor P, aluno A WHERE LOWER(A.nivel) = '%mestrado%' AND A.mat_professor = P.matricula) > 1;
 AND 

 SELECT AF.*, COUNT(*)
FROM agencia_financiadora AF, aluno A
WHERE (SELECT COUNT(*) FROM agencia_financiadora AF, aluno A WHERE LOWER(A.nivel) LIKE '%mestrado%' AND A.cod_agencia = AF.codigo) >= 0;


