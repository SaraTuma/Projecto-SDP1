CREATE DATABASE clube;

-- Criando tabelas para a localização e tabelas auxiliares
CREATE TABLE provincia
(
    pk_provincia	serial NOT NULL PRIMARY KEY,
    descricao		varchar NOT NULL
);

CREATE TABLE municipio
(
    pk_municipio	serial NOT NULL PRIMARY KEY,
    descricao		varchar NOT NULL,
    fk_provincia	integer NOT NULL REFERENCES provincia (pk_provincia)
        			ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE comuna
(
    pk_comuna 		serial NOT NULL PRIMARY KEY,
    descricao 		varchar NOT NULL,
    fk_municipio 	integer NOT NULL REFERENCES municipio (pk_municipio)
			ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE morada
(
    pk_morada 		serial NOT NULL PRIMARY KEY,
    bairro 		varchar NOT NULL,
    rua 		varchar NOT NULL,
    ncasa 		integer NOT NULL,
    fk_comuna 		integer NOT NULL REFERENCES comuna (pk_comuna)
        		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE estado_civil
(
    pk_estado_civil	serial NOT NULL PRIMARY KEY,
    descricao 		varchar NOT NULL
);

CREATE TABLE sexo
(
    pk_sexo 		serial NOT NULL PRIMARY KEY,
    descricao 		varchar NOT NULL
);

CREATE TABLE categoria_socio
(
    pk_categoria 	serial NOT NULL PRIMARY KEY,
    descricao 		character varying NOT NULL
);

CREATE TABLE classificacao
(
    pk_classificacao 	serial NOT NULL PRIMARY KEY,
    descricao 		character varying NOT NULL
);

CREATE TABLE genero
(
    pk_genero 		serial NOT NULL PRIMARY KEY,
    descricao 		character varying NOT NULL
);

-- Tabelas principais

CREATE TABLE pessoa
(
    pk_pessoa 		serial NOT NULL PRIMARY KEY,
    nome		varchar NOT NULL,
    num_bi 		varchar NOT NULL unique,
    data_nascimento 	date NOT NULL,
    telefone 		varchar NOT NULL,
    email 		varchar NOT NULL,
    fk_morada 		integer NOT NULL REFERENCES morada (pk_morada)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    fk_sexo 		integer NOT NULL REFERENCES sexo (pk_sexo)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    fk_estado_civil 	integer NOT NULL REFERENCES estado_civil (pk_estado_civil)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE realizador
(
    pk_realizador 	serial NOT NULL PRIMARY KEY,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa) 
    			ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE actor
(
    pk_actor 		serial NOT NULL PRIMARY KEY,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa) 
    			ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE socio
(
    pk_socio 		serial NOT NULL PRIMARY KEY,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa) 
    			ON UPDATE CASCADE ON DELETE CASCADE,
    fk_categoria 	integer NOT NULL REFERENCES categoria_socio (pk_categoria)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE filme
(
    pk_filme 		serial NOT NULL PRIMARY KEY,
    titulo_orig 	varchar NOT NULL,
    titulo_port 	varchar ,
    sinopse 		varchar  NOT NULL,
    duracao 		time without time zone NOT NULL,
    fk_realizador 	integer NOT NULL REFERENCES realizador (pk_realizador)
    			ON UPDATE CASCADE ON DELETE CASCADE,
    fk_classificacao 	integer NOT NULL REFERENCES classificacao (pk_classificacao)
    			ON UPDATE CASCADE ON DELETE CASCADE,
    fk_genero 		integer NOT NULL REFERENCES genero (pk_genero)
    			ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    ano_publicado	integer NOT NULL
);

CREATE TABLE alugar
(
    pk_alugar 		serial NOT NULL PRIMARY KEY,
    data_alugar 	date NOT NULL DEFAULT CURRENT_DATE,
    data_devolucao 	date NOT NULL CHECK(data_alugar <= data_devolucao),
    fk_socio 		integer NOT NULL REFERENCES socio (pk_socio)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    fk_filme 		integer NOT NULL REFERENCES filme (pk_filme)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE filme_actor
(
    fk_filme 		integer NOT NULL REFERENCES filme (pk_filme)
    		        ON UPDATE CASCADE ON DELETE CASCADE,
    fk_actor 		integer NOT NULL REFERENCES actor (pk_actor)
    		        ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    
);
