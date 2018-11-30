INSERT INTO departamento VALUES (1, 'computação', 'rua do dep. 1', NULL);
INSERT INTO departamento VALUES (2, 'estatística', 'rua do dep. 2', NULL);

INSERT INTO departamento_telefone VALUES (1, '99999-9999');
INSERT INTO departamento_telefone VALUES (2, NULL);

INSERT INTO professor VALUES (1, 'claudio', 'phd', 1, '08-30-1965');
INSERT INTO professor VALUES (2, 'amanda', 'mestrado', 2, '09-04-1970');

UPDATE departamento SET mat_professor=1 WHERE codigo=1;
UPDATE departamento SET mat_professor=2 WHERE codigo=2;