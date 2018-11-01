
CREATE TABLE Professor (	
	matricula INT,
	nome VARCHAR(20),
	dt_nasc DATE,
	titulacao VARCHAR(10),
	codigo INT,
	codlab INT,
	PRIMARY KEY (matricula), 
	FOREIGN KEY (martricula),
	FOREIGN KEY (codigo) REFERENCES Departamento(codigo),
	FOREIGN KEY (codlab) REFERENCES Laboratorio(codlab)
);

CREATE TABLE Aluno (	
	matricula INT,
	nome VARCHAR(30) NOT NULL,
	dt_nasc DATE,
	nivel INT,
	matricula_pf INT,
	cod_prod INT,
	cod_lnpq INT,
	sod_cnpq INT,
	codigo_agencia INT,
	valor NUMBER,
	dt_inicio DATE,
	dt_fim DATE,
	horas INT,
	PRIMARY KEY (matricula),
	FOREIGN KEY (matricula_pf) REFERENCES Professor(matricula),	
	FOREIGN KEY (cod_prod) REFERENCES Projeto(cod_prod),
	FOREIGN KEY (cod_lnpq, sub_cnpq) REFERENCES LinhaPesquisa(cod_lnpq, sub_cnpq),
	FOREIGN KEY (codigo_agencia) REFERENCES AgenciaFinanciadora(codigo)
);

CREATE TABLE Departamento (	
	codDepartamento INT,
	endereco VARCHAR(30),
	nome VARCHAR(15),
	PRIMARY KEY (codDepartamento) 
);

CREATE TABLE LinhaPesquisa (	
	codLinhaPesquisa INT,
	subCnpq INT,
	nomeArea VARCHAR(10) NOT NULL,
	nomeSubArea VARCHAR(10),
	PRIMARY KEY (codLinhaPesquisa, subCnpq)
);

CREATE TABLE Laboratorio ( 
	codLaboratorio INT,
	nome VARCHAR(25),
	local VARCHAR(30),
	PRIMARY KEY (codLaboratorio)
);

	-- ENTIDADE FRACA
CREATE TABLE Recurso  (	
	codRecurso INT,
	descricao VARCHAR(100),
	codLaboratorio INT,
	PRIMARY KEY (codRecurso,codLaboratorio),
	FOREIGN KEY (codLaboratorio) references Laboratorio(codLaboratorio),
);

CREATE TABLE Projeto (		
	codProjeto INT,
	orcamento NUMBER,
	titulo VARCHAR(25),
	descricao VARCHAR(100),
	dt_inicio DATE NOT NULL,
	dt_fim DATE NOT NULL,
	matricula_ INT,
	PRIMARY KEY (codProjeto),
	FOREIGN KEY (matricula_) REFERENCES Professor(matricula)
);

CREATE TABLE AgenciaFinanciadora (	
	codAgencia INT,
	nome VARCHAR(15) NOT NULL,
	email VARCHAR(30),
	-- telefone INT, --atributo multivalorado
	endereco VARCHAR(30),
	PRIMARY KEY (codAgencia)
);

CREATE TABLE Publicacao (
	codPublicacao INT,
	titulo VARCHAR(30) NOT NULL,
	veiculo VARCHAR(20),
	ano INT,
	matricula_ INT,
	codprod INT,
	PRIMARY KEY (codPublicacao),
	FOREIGN KEY (matricula_) REFERENCES Professor(matricula),
	FOREIGN KEY (codprod) REFERENCES Projeto(codprod)
);

CREATE TABLE Patente (		
	codPatente INT,
	numreg INT,
	descricao varchar(100),
	codprod INT,
	PRIMARY KEY (codPatente),
	FOREIGN KEY (codprod) REFERENCES Projeto(codprod)
);	

CREATE TABLE TelefoneAgencia(	
	codigo INT, 
	telefone VARCHAR(20),
	PRIMARY KEY (telefone, codigo),
	FOREIGN KEY (codigo) REFERENCES AgenciaFinanciadora(codigo)
);

CREATE TABLE TelefoneDepartamento (
	telefone VARCHAR(20),
	codigo INT,
	PRIMARY KEY (telefone, codigo),
	FOREIGN KEY (codigo) REFERENCES Departamento(codigo)
);

-- RELACIONAMENTOS N PARA N

CREATE TABLE financia (
	
	codigoAgencia INT,
	codProd INT,
	PRIMARY KEY (codigoAgencia, codProd),
	FOREIGN KEY (codigoAgencia) REFERENCES AgenciaFinanciadora(codigoAgencia),
	FOREIGN KEY (codProd) REFERENCES Projeto(codProd)
);	--Entre Agencia e Projeto

CREATE TABLE executa (
	codLab INT,
	codProd INT,
	PRIMARY KEY (codLab, codProd),
	FOREIGN KEY (codLab) REFERENCES Laboratorio(codLab),
	FOREIGN KEY (codProd) REFERENCES Projeto(codProd)
);	-- Entre Laboratorio e Projeto

CREATE TABLE linhaPesquisa_contem (
	codLnpq INT,
	subCnpq INT,
	matricula INT,
	PRIMARY KEY (codLnpq, subCnpq, matricula),
	FOREIGN KEY (codLnpq, subCnpq) REFERENCES LinhaPesquisa(codLnpq, subCnpq),
	FOREIGN KEY (matricula) REFERENCES Professor(matricula)
);	-- Entre Linha de Pesquisa e Professor

CREATE TABLE esta_em (
	codLnpq INT,
	subCnpq INT,
	codProd INT,
	PRIMARY KEY (codLnpq, subCnpq, codProd),
	FOREIGN KEY (codLnpq, subCnpq) REFERENCES LinhaPesquisa(codLnpq, subCnpq),
	FOREIGN KEY (codProd) REFERENCES Projeto(codProd)
);	-- Entre Linha de Pesquisa e Projeto

CREATE TABLE ProfessorParticipa (
	matricula INT,
	codProd INT,
	PRIMARY KEY (matricula, codProd),
	FOREIGN KEY (matricula) REFERENCES Professor(matricula),
	FOREIGN KEY (codProd) REFERENCES Projeto(codProd)
);	-- Entre Professor e Projeto

CREATE TABLE AlunoParticipa (
	matricula INT,
	codigo INT,
	PRIMARY KEY (matricula, codigo),
	FOREIGN KEY (matricula) REFERENCES Aluno(matricula),
	FOREIGN KEY (codigo) REFERENCES Publicacao(codigo)
);	-- Entre Aluno e Publicacao



