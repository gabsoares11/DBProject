CREATE TABLE Aluno (
	matricula INT,
	nome VARCHAR(20),
	dt_nasc DATE,
	nivel INT,
	PRIMARY KEY (matricula)
	--  FOREIGN KEY (matricula) REFERENCES professor(matricula)
	--  FOREIGN KEY (matricula) REFERENCES 

);

CREATE TABLE Professor (
	matricula INT,
	nome VARCHAR(20),
	dt_nasc DATE,
	titulacao VARCHAR(10),
	PRIMARY KEY (matricula)
);

CREATE TABLE Departamento (
	codDepartamento INT,
	endereco VARCHAR(30),
	nome VARCHAR(15),
	telefone INT, --atributo multivalorado
	PRIMARY KEY (codDepartamento) 
);

CREATE TABLE LinhaPesquisa (
	codLinhaPesquisa INT,
	subCnpq INT NOT NULL,
	nomeArea VARCHAR(10),
	nomeSubArea VARCHAR(10),
	PRIMARY KEY (codLinhaPesquisa, subCnpq)
);

CREATE TABLE Laboratorio (
	-- recurso: entidade fraca
	codLaboratorio INT,
	nome VARCHAR(15),
	local VARCHAR(20),
	PRIMARY KEY (codLaboratorio)
);

CREATE TABLE Recurso  (
	codRecurso INT,
	descricao VARCHAR(40),
	PRIMARY KEY (codRecurso)
);

CREATE TABLE Projeto (
	codProjeto INT,
	orcamento NUMERIC(7,2),
	titulo VARCHAR(15),
	descricao VARCHAR(30),
	dt_inicio DATE,
	dt_fim DATE,
	PRIMARY KEY (codProjeto)
);

CREATE TABLE AgenciaFinanciadora (
	codAgencia INT,
	nome VARCHAR(15),
	email VARCHAR(30),
	telefone INT, --atributo multivalorado
	endereco VARCHAR(30),
	PRIMARY KEY (codAgencia)
);

CREATE TABLE Publicacao (
	codPublicacao INT,
	titulo VARCHAR(20) NOT NULL,
	veiculo VARCHAR(10),
	ano INT,
	PRIMARY KEY (codPublicacao)
);

CREATE TABLE Patente (
	codPatente INT,
	numreg INT,
	descricao varchar(20),
	PRIMARY KEY (codPatente)
);	
