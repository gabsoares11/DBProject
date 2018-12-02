INSERT INTO departamento VALUES (1, 'computação', 'rua do dep. 1', NULL);
INSERT INTO departamento VALUES (2, 'estatística', 'rua do dep. 2', NULL);

INSERT INTO departamento_telefone VALUES (1, '99999-9999');
INSERT INTO departamento_telefone VALUES (2, '99999-9999');

INSERT INTO professor VALUES (1, 'claudio', 'phd', 1, '08-30-1965');
INSERT INTO professor VALUES (2, 'amanda', 'mestrado', 2, '09-04-1970');
INSERT INTO professor VALUES (3, 'joao', 'doutorado', 1, '04-24-1983');

UPDATE departamento SET mat_professor=1 WHERE codigo=1;
UPDATE departamento SET mat_professor=2 WHERE codigo=2;

INSERT INTO agencia_financiadora VALUES (100, 'agencia1', 'agencia1@email.com', 'agencia1 address');
INSERT INTO agencia_financiadora VALUES (200, 'agencia2', 'agencia2@email.com', 'agencia2 address');


INSERT INTO projeto VALUES (1, 1, 185000, 'projeto 1', 'descricao do projeto 1', '01-01-2007', '05-28-2017', 4);
INSERT INTO projeto VALUES (2, 2, 4000.00, 'projeto 2', 'descricao do projeto 2', '03-22-2009', NULL, 3);
INSERT INTO projeto VALUES (3, 1, 12000.00, 'projeto 3', 'descricao do projeto 3', '04-13-2016', NULL, 1);
INSERT INTO projeto VALUES (4, 2, 5700.00, 'projeto 4', 'descricao do projeto 4', '12-31-2015', NULL, 2);
INSERT INTO projeto VALUES (5, 3, 10000.00, 'projeto 5', 'descricao do projeto 5', '02-15-2008', NULL, 4);

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

INSERT INTO laboratorio VALUES (1100, 'laboratorio 1', 'local do lab 1', 1);
INSERT INTO laboratorio VALUES (2200, 'laboratorio 2', 'local do lab 2', 3);

INSERT INTO laboratorio_projeto VALUES (1100, 3);
INSERT INTO laboratorio_projeto VALUES (2200, 5);