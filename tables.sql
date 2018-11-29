
-- Esquema padrao para o projeto de Banco de Dados 1 2018.2

CREATE TABLE professor (
	matricula        INT         PRIMARY KEY,
	nome             VARCHAR(100) NOT NULL,
	titulacao        VARCHAR(20),
    cod_departamento INT,
	dt_nasc          DATE
);

CREATE TABLE aluno (
    matricula       INT         PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    nivel           VARCHAR(150),
    mat_professor   INT,
    cod_projeto     INT,
    cod_cnpq        INT,
    cod_sub_cnpq    INT,
    dt_nasc         DATE,
    cod_agencia     INT,
    valor_bolsa     INT,
    dt_inicio       DATE,
    dt_fim          DATE,
    horas           INT,


    FOREIGN KEY (mat_professor) 
    REFERENCES  professor(matricula)
);

CREATE TABLE projeto (
    codigo          INT         PRIMARY KEY,
    mat_professor   INT         NOT NULL,
    orcamento       NUMERIC(10, 2),
    titulo          VARCHAR(100),
    descricao       VARCHAR(100),
    dt_inicio       DATE,
    dt_fim          DATE,
    premiacao       INT DEFAULT 0 NOT NULL,

    FOREIGN KEY (mat_professor) 
    REFERENCES  professor(matricula)
);

CREATE TABLE departamento (
    codigo        INT          PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL,
    endereco      VARCHAR(200) NOT NULL,
    mat_professor INT,


    FOREIGN KEY (mat_professor) 
    REFERENCES  professor(matricula)
);

CREATE TABLE laboratorio (
	codigo  INT          PRIMARY KEY,
	nome    VARCHAR(100) NOT NULL,
	local   VARCHAR(200),
    mat_professor INT,


    FOREIGN KEY (mat_professor) 
    REFERENCES  professor(matricula)
);

CREATE TABLE recurso (
	codigo      INT,
	cod_recurso INT,
	descricao   VARCHAR(300),

	PRIMARY KEY (codigo, cod_recurso),
	
 
    FOREIGN KEY (cod_recurso) 
    REFERENCES  laboratorio(codigo) 
    ON DELETE   CASCADE
);

CREATE TABLE linha_de_pesquisa (
    cod_cnpq            INT,
    cod_sub_cnpq        INT,
    nome_area           VARCHAR(100)   NOT NULL,
    nome_subarea        VARCHAR(100),
    
    PRIMARY KEY (cod_cnpq,cod_sub_cnpq)
);

CREATE TABLE patente (
    codigo      INT         PRIMARY KEY,
    num_reg     INT         UNIQUE  NOT NULL,
    descricao   VARCHAR(300),
    cod_projeto INT,
    

    FOREIGN KEY (cod_projeto) 
    REFERENCES  projeto(codigo)
);

CREATE TABLE publicacao (
    codigo          INT          PRIMARY KEY,
    titulo          VARCHAR(200) NOT NULL,
    veiculo         VARCHAR(100),
    ano             INT,
    cod_projeto     INT,
    mat_professor   INT,
    

    FOREIGN KEY (cod_projeto) 
    REFERENCES  projeto(codigo),


    FOREIGN KEY (mat_professor) 
    REFERENCES  professor(matricula)
);

CREATE TABLE agencia_financiadora (
	codigo      INT             PRIMARY KEY, 
	nome        VARCHAR(200)    NOT NULL,
	email       VARCHAR(40)     NOT NULL,
	endereco    VARCHAR(200)
);



-- Tabelas que compoem os relacionamentos do modelo
-- Criacao de tabelas para os relacionamentos N:N

CREATE TABLE pesquisa_projeto (
    cod_cnpq        INT,
    cod_sub_cnpq    INT, 
    cod_projeto     INT,
    
    PRIMARY KEY (cod_cnpq, cod_sub_cnpq, cod_projeto),
    

    FOREIGN KEY (cod_projeto) 
    REFERENCES  projeto(codigo),


    FOREIGN KEY (cod_cnpq, cod_sub_cnpq) 
    REFERENCES  linha_de_pesquisa(cod_cnpq, cod_sub_cnpq)
);

CREATE TABLE professor_pesquisa (
    mat_professor   INT,
    cod_cnpq        INT,
    cod_sub_cnpq    INT,  

    PRIMARY KEY (mat_professor, cod_cnpq, cod_sub_cnpq),


    FOREIGN KEY (mat_professor) 
    REFERENCES professor(matricula),


    FOREIGN KEY (cod_cnpq, cod_sub_cnpq) 
    REFERENCES  linha_de_pesquisa(cod_cnpq, cod_sub_cnpq)
);

CREATE TABLE professor_projeto (
    mat_professor    INT,
    cod_projeto      INT,
  
    PRIMARY KEY (mat_professor, cod_projeto),
    

    FOREIGN KEY (mat_professor) 
    REFERENCES  professor(matricula),


    FOREIGN KEY (cod_projeto) 
    REFERENCES  projeto(codigo)
);

CREATE TABLE laboratorio_projeto (
    cod_laboratorio     INT,
    cod_projeto         INT,

    PRIMARY KEY (cod_laboratorio,cod_projeto),


    FOREIGN KEY (cod_laboratorio) 
    REFERENCES  laboratorio(codigo),


    FOREIGN KEY (cod_projeto)
    REFERENCES  projeto(codigo)
);

CREATE TABLE aluno_publicacao (
    mat_aluno       INT,
    cod_publicacao  INT,

    PRIMARY KEY (mat_aluno,cod_publicacao),
    

    FOREIGN KEY (mat_aluno) 
    REFERENCES  aluno(matricula),


    FOREIGN KEY (cod_publicacao) 
    REFERENCES  publicacao(codigo)
);

CREATE TABLE agencia_projeto (
    cod_agencia     INT,
    cod_projeto     INT,

    PRIMARY KEY (cod_agencia,cod_projeto), 


    FOREIGN KEY (cod_agencia) 
    REFERENCES  agencia_financiadora(codigo),


    FOREIGN KEY (cod_projeto) 
    REFERENCES  projeto(codigo)
);

-- Colecoes que compoem o modelo
-- Tabela de telefones

CREATE TABLE agencia_telefone (
    cod_agencia     INT,
    telefone        VARCHAR(15),
    
    PRIMARY KEY (cod_agencia,telefone),


    FOREIGN KEY (cod_agencia) 
    REFERENCES  agencia_financiadora(codigo)
);


CREATE TABLE departamento_telefone (
    cod_departamento    INT,
    telefone            VARCHAR(15),
    
    PRIMARY KEY (cod_departamento,telefone),


    FOREIGN KEY (cod_departamento) 
    REFERENCES  departamento(codigo)
);

-- Constraints que compoem o modelo
-- Adicao de chaves estrangeiras

ALTER TABLE professor 
    ADD CONSTRAINT fk_possui_cod_dep
    FOREIGN KEY (cod_departamento) 
    REFERENCES  departamento(codigo);

ALTER TABLE aluno 
    ADD CONSTRAINT fk_part_cod_proj
    FOREIGN KEY (cod_projeto) 
    REFERENCES  projeto(codigo);

ALTER TABLE aluno 
    ADD CONSTRAINT fk_bolsa_cod_age
    FOREIGN KEY (cod_agencia) 
    REFERENCES  agencia_financiadora(codigo);

ALTER TABLE aluno 
    ADD CONSTRAINT fk_tem_lp
    FOREIGN KEY (cod_cnpq,cod_sub_cnpq) 
    REFERENCES  linha_de_pesquisa(cod_cnpq,cod_sub_cnpq);
