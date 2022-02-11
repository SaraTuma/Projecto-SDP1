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
    pk_genero 	serial NOT NULL PRIMARY KEY,
    descricao 	character varying NOT NULL
);



-- Tabelas principais

CREATE TABLE pessoa
(
    pk_pessoa 		serial NOT NULL PRIMARY KEY,
    pnome		varchar NOT NULL,
    unome		varchar NOT NULL,
    num_bi 		varchar NOT NULL unique,
    data_nascimento 	date NOT NULL,
    fk_morada 		integer NOT NULL REFERENCES morada (pk_morada)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    fk_sexo 		integer NOT NULL REFERENCES sexo (pk_sexo)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    fk_estado_civil 	integer NOT NULL REFERENCES estado_civil (pk_estado_civil)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE 
);

CREATE TABLE telefone
(
    pk_telefone 	serial NOT NULL PRIMARY KEY,
    descricao 		character varying NOT NULL,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa)
);

CREATE TABLE email
(
    pk_email 		serial NOT NULL PRIMARY KEY,
    descricao 		character varying NOT NULL,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa)
);

CREATE TABLE realizador
(
    pk_realizador 	serial NOT NULL PRIMARY KEY,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa) 
    			ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE actor
(
    pk_actor 		serial NOT NULL PRIMARY KEY,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa) 
    			ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE socio
(
    pk_socio 		serial NOT NULL PRIMARY KEY,
    fk_pessoa 		integer NOT NULL REFERENCES pessoa (pk_pessoa) 
    			ON UPDATE CASCADE ON DELETE CASCADE,
    fk_categoria 	integer NOT NULL REFERENCES categoria_socio (pk_categoria)
        		ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE
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
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE,
    
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
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE 
);

CREATE TABLE filme_actor
(
    fk_filme 		integer NOT NULL REFERENCES filme (pk_filme)
    		        ON UPDATE CASCADE ON DELETE CASCADE,
    fk_actor 		integer NOT NULL REFERENCES actor (pk_actor)
    		        ON UPDATE CASCADE ON DELETE CASCADE,
    data_cadastro	date NOT NULL DEFAULT CURRENT_DATE
    
);

--------------------- Inserção de dados na base de dados


-- Classificação do filme

INSERT INTO classificacao(descricao) VALUES ('M/6');
INSERT INTO classificacao(descricao) VALUES ('M/12');
INSERT INTO classificacao(descricao) VALUES ('M/16');
INSERT INTO classificacao(descricao) VALUES ('M/18');
INSERT INTO classificacao(descricao) VALUES ('Adultos');

-- Genero do filme

INSERT INTO genero(descricao) VALUES ('Comédia');
INSERT INTO genero(descricao) VALUES ('Aventura');
INSERT INTO genero(descricao) VALUES ('Ação');
INSERT INTO genero(descricao) VALUES ('Romance');
INSERT INTO genero(descricao) VALUES ('Drama');
INSERT INTO genero(descricao) VALUES ('Terror');
INSERT INTO genero(descricao) VALUES ('Infatil');
INSERT INTO genero(descricao) VALUES ('Dança');
INSERT INTO genero(descricao) VALUES ('Documentário');
INSERT INTO genero(descricao) VALUES ('Espionagem');
INSERT INTO genero(descricao) VALUES ('Fantasia');
INSERT INTO genero(descricao) VALUES ('Ficção Científica');
INSERT INTO genero(descricao) VALUES ('Musical');
INSERT INTO genero(descricao) VALUES ('Thriller');


-- Sexo

INSERT INTO sexo(descricao) VALUES ('Femenino');
INSERT INTO sexo(descricao) VALUES ('Masculino');

-- Estado civil

INSERT INTO estado_civil(descricao) VALUES ('Solteiro/a');
INSERT INTO estado_civil(descricao) VALUES ('Casado/a');
INSERT INTO estado_civil(descricao) VALUES ('Divorciado/a');
INSERT INTO estado_civil(descricao) VALUES ('Viúvo/a');

-- Insert da localização (Provincias, Municipios e Comunas)

/*Adicionando Provincias*/

INSERT INTO provincia(descricao) VALUES ('Luanda');

INSERT INTO provincia(descricao) VALUES ('Bengo');
INSERT INTO provincia(descricao) VALUES ('Benguela');
INSERT INTO provincia(descricao) VALUES ('Bie');
INSERT INTO provincia(descricao) VALUES ('Cabinda');
INSERT INTO provincia(descricao) VALUES ('Cunene');
INSERT INTO provincia(descricao) VALUES ('Kuando-Kubango');
INSERT INTO provincia(descricao) VALUES ('Kwanza-Norte');
INSERT INTO provincia(descricao) VALUES ('Kwanza-Sul');
INSERT INTO provincia(descricao) VALUES ('Huambo');
INSERT INTO provincia(descricao) VALUES ('Huila');
INSERT INTO provincia(descricao) VALUES ('Lunda-Norte');
INSERT INTO provincia(descricao) VALUES ('Lunda-Sul');
INSERT INTO provincia(descricao) VALUES ('Malanje');
INSERT INTO provincia(descricao) VALUES ('Moxico');
INSERT INTO provincia(descricao) VALUES ('Namibe');
INSERT INTO provincia(descricao) VALUES ('Uige');
INSERT INTO provincia(descricao) VALUES ('Zaire');

/*Adicionando Municipios*/

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Kilamba Kiaxi',1);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Belas',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cacuaco',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cazenga',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Icolo e Bengo',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Luanda',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quiçama (Quissama)',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Talatona',1);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Viana',1);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ambriz',2);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Dande',2);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Dembos',2);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bula Atumba',2);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Nambuangongo',2);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Pango Aluquém (Pango Aluquêm)',2);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Balombo',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Baía Farta',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Benguela',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bocoio',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Caimbambo',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Catumbela',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chongoroi',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cubal',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ganda',3);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Lobito',3);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Andulo',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Camacupa',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Catabola',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chinguar',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chitembo',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuemba',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cunhinga',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuito (Kuito)',4);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Nharêa',4);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Belize',5);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Buco-Zau',5);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cabinda',5);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cacongo',5);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cahama',6);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuanhama (Kwanhama)',6);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Curoca',6);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuvelai',6);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Namacunde',6);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ombadja',6);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bailundo',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cachiungo (Catchiungo)',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Caála',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ecunha (Ekunha)',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Huambo',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Londuimbali',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Longonjo (Longongo)',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Mungo',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chicala-Cholohanga (Tchicala-Tcholoanga)',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chinjenje (Tchindjenje)',10);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ucuma',10);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Caconda',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cacula',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Caluquembe',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Gambos',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chibia',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chicomba',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chipindo',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Humpata',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Jamba',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuvango (Kuvango)',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Lubango',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Matala',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quilengues',11);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quipungo',11);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Calai',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuangar',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuchi',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuito Cuanavale (Kuito Kuanavale)',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Dirico',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Nancova (Nankova)',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Mavinga',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Menongue',7);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Rivungo',7);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ambaca',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Banga',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bolongongo',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cambambe',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cazengo',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Golungo Alto',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ngonguembo (Gonguembo)',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Lucala',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quiculungo',8);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Samba Caju',8);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Amboim',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cassongue',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Conda',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ebo',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Libolo',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Mussende',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Porto Amboim',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quibala',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quilenda',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Seles',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Sumbe',9);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cela',9);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cambulo',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Capenda Camulemba',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Caungula',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Chitato',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuango',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuilo',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Lubalo',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Lucapa',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Xá Muteba',12);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Lóvua',12);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cacolo',13);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Dala',13);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Muconda',13);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Saurimo',13);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cacuso',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Calandula',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cambundi Catembo',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cangandala',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cahombo (Caombo)',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Kiwaba Nzoji (Cuaba Nzogo)',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Kunda dya Baze (Cunda-Diaza)',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Luquembo',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Malange',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Marimba',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Massango',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Mucari',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quela',14);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quirima',14);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Alto Zambeze',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bundas',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Camanongue',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cameia (Lumeji)',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Luau',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Luacano (Lucano)',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Luchazes',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Léua',15);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Moxico',15);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bibala',16);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Camacuio (Camulo)',16);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Moçâmedes (Namibe)',16);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Tômbwa',16);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Virei',16);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Alto Cauale',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Ambuíla',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bembe',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Buengas',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Bungo',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Damba',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Milunga',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Mucaba',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Negage',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Puri',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Quimbele',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Dange-Quitexe',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Pombo',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Songo',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Uíge',17);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Maquela do Zombo',17);

INSERT INTO municipio(descricao, fk_provincia) VALUES ('Cuimba',18);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('MBanza Kongo',18);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Noqui',18);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('NZeto',18);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Soyo',18);
INSERT INTO municipio(descricao, fk_provincia) VALUES ('Tomboco',18);

/*Adicionando comunas*/

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Golfe',1);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Palanca',1);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Nova Vida',1);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Sapú',1);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Barra do Kwanza',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cabolombo',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kilamba',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Morro dos Veados',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quenguela',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ramiros',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Vila Verde',2);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cacuaco',3);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Funda',3);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kikolo',3);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mulenvos de Baixo',3);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Sequele',3);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cazenga Popular',4);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Hoji-ya-Henda',4);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kalawenda',4);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kima Kieza',4);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tala Hadi',4);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('11 de Novembro',4);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bela Vista',5);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bom Jesus',5);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cabiri',5);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Catete',5);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cassoneca',5);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caculo Cahango',5);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cabo Ledo',7);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Demba-Chio',7);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mumbondo',7);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Muxima',7);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quixingue',7);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Benfica',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Camama',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cidade Universitária',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Futungo de Belas',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lar do Patriota',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mussulo',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Talatona',8);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Calumbo',9);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Viana',9);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kikuxi',9);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ambriz',10);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bela Vista',10);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tabi',10);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bula Atumba',13);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quiage',13);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Barra do Dande',11);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caxito',11);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mabubas',11);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quicabo',11);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Úcua',11);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Paredes',12);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Piri',12);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quixabe',12);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('São José das Matas',12);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cage',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Canacassala',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Gombe',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Muxaluando',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quicunzo',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quixico',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Zala',14);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Pango-Aluquém',15);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cazuangongo',15);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Baía Farta',17);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Dombe Grande',17);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Esquimina',17);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kalohanga',17);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Balombo',16);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chindumbo',16);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chingongo',16);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Maka-Mombolo',16);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bocoio',19);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chila',19);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cubal do Lumbo',19);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Monte Belo',19);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Passe',19);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caimbambo',20);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Canhamela',20);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Catengue',20);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cayavi',20);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Wyangombe',20);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Biopia',21);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Catumbela',21);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Gama',21);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Egito Praia',21);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bolonguera',22);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chongorói',22);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kamuine',22);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Capupa',23);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cubal',23);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Imbala',23);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tumbulo',23);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Babaera',24);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Casseque',24);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chicuma',24);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ebanga',24);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ganda',24);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lobito',25);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Canjala',25);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Culango',25);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Andulo',26);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Calucinga',26);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cassumbe',26);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chivaúlo',26);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Camacupa',27);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cuanza',27);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ringoma',27);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Santo António de Muinha',27);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Umpulo',27);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caivera',28);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Catabola',28);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chipeta',28);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chiuca',28);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Sande',28);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chinguar',29);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cutato',29);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kangote',29);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cachingues',30);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chitembo',30);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Malengue',30);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mutambo',30);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mumbué',30);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Soma Cuanza',30);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cuemba',31);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Luando',31);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Sachineuma',31);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Belo Horizonte',32);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cunhinga',32);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chicala',33);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kambândua',33);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kuito',33);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kunje',33);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Trumba',33);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caieie',34);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Dando',34);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Gamba',34);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lúbia',34);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Nharea',34);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Belize',35);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Luali',35);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Miconje',35);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cabinda',37);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Malembo',37);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tanto-Zinze',37);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Buco-Zau',36);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Inhuca',36);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Necuto',36);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Dinge',38);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lândana',38);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Massabi',38);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Calai',70);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Maúe',70);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mavengue',70);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bondo',71);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cuangar',71);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Savate',71);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chinguanja',72);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cuchi',72);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cutato',72);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Muila',72);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Baixo Longa',73);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cuito Cuanavale',73);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Longa',73);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lupire',73);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Dirico',74);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mucusso',74);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Xamavera',74);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cunjamba',76);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cutuile',76);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Luengue',76);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mavinga',76);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caiundo',77);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cueio',77);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Menongue',77);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caála',75);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Rito',75);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chipundo/Neriquinha',78);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Luiana',78);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Rivungo',78);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cahama',39);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Otchindjau',39);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chimpolo',40);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Evale',40);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Môngua',40);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Nehone',40);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ondjiva',40);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chitado',41);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Oncócua',41);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kalonga',42);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kubati',42);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mukolongondjo',42);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mupa',42);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Namacunde',43);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Shiede',43);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Humbe',44);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mucope',44);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Naulila',44);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ombala-yo-Mungo',44);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Xangongo',44);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chipipa',49);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kalima',49);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Huambo',49);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bailundo',45);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Binge',45);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Henge',45);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lunge',45);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Luvemba',45);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ekunha',48);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tchipeio',48);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caála',47);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kalenga',47);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Katata',47);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kuima',47);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Catchiungo',46);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chinhama',46);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chiumo',46);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Alto Uama',50);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Galanga',50);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kumbila',50);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Londuimbale',50);


INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ussoke',50);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chilata',51);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Katabola',51);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lepi',51);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kambuengo',52);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mungo',52);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mbave',53);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Sambo',53);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Samboto',53);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tchicala-Tcholonga',53);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chiaca',54);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tchindjenje',54);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Kakoma',55);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mundundo',55);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ucama',55);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caconda',56);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cusse',56);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Gungi',56);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Uaba',56);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cacula',57);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Caluquembe',58);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chiange',1);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chibemba',1);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Capunda',60);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cavilongo',60);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chibia',60);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Jau',60);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quihita',60);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chicomba',61);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cutenda',61);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Libongue',61);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quê',61);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bambi',62);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Chipindo',62);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cuvango',65);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Galangue',65);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Vicungo',65);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Humpata',63);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Cassinga',64);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Dongo',64);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Jamba',64);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Arimba',66);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Hoque',66);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Huíla',66);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Lubango',66);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Capelongo',67);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Matala',67);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Mulongo',67);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Dinde',68);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Impulso',68);

INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quilengues',68);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Quipungo',69);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Ambaca',79);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Bindo',79);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Luinga',79);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Maua',79);
INSERT INTO comuna(descricao, fk_municipio) VALUES ('Tango',79);


-- Morada

INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Palanca', 'Ngola Inene', 42, 2);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('500 Casas', 'Rua do Popalá', 100, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro das Salinas', 'Rua B', 23, 10);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro das Tendas', 'Rua da Pracinha', 23, 6);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro das Tendas', 'Rua F', 78, 6);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Kikolo', 'Rua 12', 234, 14);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Kikolo', 'Rua 6', 10, 14);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Mande', 'Rua Do B. Mande', 56, 6);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Mande', 'Rua Dos Quarteis', 100, 6);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Mande', 'Rua E', 34, 6);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Matadouro', 'Rua do Matadouro', 67, 9);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Matadouro', 'Rua do Matadouro', 78, 9);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Matadouro', 'Rua do Matadouro', 34, 9);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Bairro Mundial', 'Rua Mundial', 45, 8);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Benfica', 'Benfica T502E', 89, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Benfica', 'Benfica T542E', 56, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Benfica', 'Avenida do Patriota', 23, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Benfica', 'Rua do Cemitério do Benfica', 256, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Calemba', 'Ngola Kanine', 13, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Calumbo', 'Vila de Calumbo', 23, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Camama', 'Mufulama', 39, 35);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cassenda', 'Rua Sagrada Eaperança', 42, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cassenda', 'Rua Unidade e Luta', 42, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cassenda', 'Rua 10', 42, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cassenda', 'Rua 11', 42, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cazenga', 'Rua dos Comandos', 34, 12);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cazenga', 'Rua do Patrício', 10, 12);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cazenga', 'Rua da comissão do Nzamba 1', 13, 12);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Chimbicato', 'Rua do Salão FM', 56, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Chimbicato', 'Condominio Jardim do Édem', 39, 35);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cuca', 'Rua da Calheta', 67, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cuca', 'Rua dos Comandos', 123, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cuca', 'Rua São Pedro', 100, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Cuca', 'Avenida Ngola Kiluanje', 723, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Dangereux', 'Fubu-Patriota', 92, 38);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Estalagem', 'Pedonal (Passeio)', 67, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Estalagem', 'Pedonal (Passeio)', 128, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Estalagem', 'Pedonal (Passeio)', 287, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Fubu', 'Rotunda da Fubu', 3, 35);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Fubu', 'Rotunda da Fubu', 56, 35);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Fubu', 'Rotunda da Fubu', 10, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Fubu', 'Rotunda da Fubu', 3, 40);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Gamek', 'Avenida Pedro de Castro Vandunem - Loy', 42, 3);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Golf', 'Rua do Mercado Correios', 98, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Golf II', 'Rua da Pracinha', 40, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Grafanil Bar', 'Rua do Grafanil', 23, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Grafanil Bar', 'Pedonal (Passeio)', 120, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Kapalanga', 'Rua Norberto de Castro', 42, 1);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Mabor', 'Rua dos Rings', 23, 17);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Palanca', 'Rua G', 56, 2);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Palanca', 'Rua A', 56, 2);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Palanca', 'Rua B', 56, 2);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Sapu', 'Rua da Sapu', 103, 42);
INSERT INTO morada(bairro, rua, ncasa, fk_comuna) VALUES ('Talatona', 'Avenida Samira Machel', 90, 40);


-- Categoria do Sócio

INSERT INTO categoria_socio(descricao) VALUES ( 'Proprietário');
INSERT INTO categoria_socio(descricao) VALUES ( 'Efectivo');
INSERT INTO categoria_socio(descricao) VALUES ( 'Contribuinte');


-- Pessoa

INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro)
	VALUES ('Sara','Tuma', '000111HA0138', '23-07-2000',1,1,1, '12-01-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Manuel','Santos','000222HA0139', '02-03-2000', 6, 2, 2, '01-10-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Maria','Santos','000333HA0130', '02-03-2000', 6, 1, 2, '29-12-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Fernando','Matias','000444HA0131', '23-09-1996', 9, 2, 1, '12-10-2000');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Filomena','Rodrigues','0007777HA013', '07-12-1980', 12, 1, 3, '06-11-2011');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Sandra','Rodrigues','0009999HA013', '23-07-1980', 50, 1, 1, '10-03-2000');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Isaura','Manico','0001999HA010', '26-07-1999', 30, 1, 1, '23-10-2012');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Creuma','Kuzola','0002999HA013', '02-04-2000', 28, 1, 2,'30-10-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Eufranio','Diogo','0003999HA093', '10-03-2001', 26, 2, 2, '19-03-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Eliana','Neto','0004999HA073', '04-03-2000', 45, 1, 1,'12-01-2022');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Marilda','Sungu','0005999HA093', '10-12-2000', 54, 1, 1, '19-01-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Mateus','Escutelo','0006999HA013', '02-10-1998', 52, 2, 2, '10-12-2009');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Yuri','Domingos','0007999HA018', '13-10-1999', 10, 2, 2, '24-05-2010');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Hernani','Manuel','0008999HA003', '05-01-2000', 15, 2, 1, '02-10-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Rosied','Francisco','000919HA010', '09-05-2000', 20, 1, 2, '27-12-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Francisco','Omela','0002199HA013', '30-12-1997', 51, 2, 1, '28-12-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Edson','Gregorio','0002299HA013', '10-10-1999', 52, 2, 1, '12-12-2019');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Valter','Kiala','0002399HA013', '02-06-1999', 53, 2, 1, '30-04-2019');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Evanildo','Tuma','0002499HA013', '17-02-1996', 31, 2, 2, '16-06-2005');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Dulcia','David','0002599HA013', '19-11-1994', 29, 1, 2, '21-01-2006');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Esperança','Domingos','0002699HA010', '11-12-1993', 32, 1, 1, '01-01-2007');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento,  fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'José','Mario','0002699HA011', '23-12-1989', 19, 2, 2, '07-07-2008');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Benvinda','Maria','0002799HA044', '19-05-2000', 35, 1, 1, '12-01-2019');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Sabina','Faria','0002799HA010', '20-08-2000', 36, 1, 2, '04-03-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Maria','Nsuzi','0002899HA010', '30-11-2000', 37, 1, 1,'12-12-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
('Geraldo','Costa','0002899HA011', '20-08-1996', 38, 2, 2, '05-02-2009');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Clemente','Eduardo','0002719HA044', '20-07-1997', 39, 2, 1,'05-01-2010');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Sergio','Oscar','0002719HA010', '28-05-1998', 42, 2, 1,'15-10-2008');

INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Ana','Cunha','0002793HA055', '20-02-2002',43, 1, 2, '18-04-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Mirela','Miguel','0002749HA010', '22-08-2000', 44, 1, 1, '19-11-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Clelia','Daniel','0002759HA010', '25-11-1994', 45, 1, 2, '12-03-2012');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Rafaela','Ernesto','0002769HA010', '12-08-1997', 46, 1, 3, '09-02-2009');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Kiala','Afonso','0002779HA010', '13-12-2000', 47, 2, 2,'05-01-2019');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Quilson','Diegues','0002789HA010', '15-07-2002', 48, 2, 3,'12-12-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Clarice','Baba','0002791HA010', '16-02-2000', 49, 1, 2, '19-12-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Paulina','Ester','0002792HA010', '10-10-2002', 51, 1, 3, '20-10-2021');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Edgar','Domingos','0002793HA010', '11-11-1995', 52, 2, 2, '11-11-2011');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Anna','Joice','0002794HA010', '12-12-1994', 53, 1, 1, '10-10-2014');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Anderson','Mario','0002795HA010', '13-01-1993', 54, 2, 3, '01-10-2017');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'William','Levi','0002796HA010', '14-02-1992', 1, 2, 2,'18-06-2009');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'David','Zepeda','0002797HA010', '15-03-1991', 2, 2, 1,'25-08-2016');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Mariana','Torres','0002798HA010', '16-04-1990', 3, 1, 2, '18-10-2009');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Maris','Rodrigues','0002799HB010', '17-05-1899', 4, 1, 3, '12-03-1915');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Selena','Gomes','0002799HC010', '18-11-2000', 5, 1, 2, '15-02-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Chris','Brown','0002799HD010', '19-06-1999', 6, 2, 3,'12-10-2010');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Charly','Flow','0002799HE010', '20-07-1991', 7, 2, 3, '27-08-2008');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Yeimy','Montoia','0002799FA010', '21-08-1990', 8, 1, 2,'12-03-2000');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Erick','Cruz','0002799HA110', '22-06-1997', 9, 2, 1, '29-12-2012');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Irma','Furacao','0002799HA210', '23-07-1995', 11, 1, 3, '10-04-2015');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Jessica','Pedro','0002799HA310', '24-08-2000', 12, 1, 3, '18-09-2020');
INSERT INTO pessoa(pnome,unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil, data_cadastro) VALUES 
( 'Jessy','Antonio','0002799HA410', '25-08-2003', 13, 2, 3, '10-12-2021');

	
-- Telefones
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('948142117', 1);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('956134000', 2);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('928159234', 3);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('967135467', 4);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('928159234', 5);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('945179234', 6);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('920179234', 7);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('912179234', 8);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('922179234', 9);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('967179234', 10);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('933179234', 11);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('944179234', 12);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('955179234', 13);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('966179234', 14);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('977179234', 15);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('988179234', 16);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('999179234', 17);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('900179234', 18);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('912119234', 19);
INSERT INTO public.telefone(descricao, fk_pessoa) VALUES ('912229234', 20);

-- Emails

INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'saratuma@gmail.com', 1);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'manuel@gmail.com', 2);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'maria@hotmail.com', 3);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'fernando@hotmail.com', 4);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'filomena@gmail.com', 5);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'sandra@gmail.com', 6);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'isaura@gmail.com', 7);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'creuma@gmail.com', 8);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'eufranio@gmail.com', 9);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'eliana@gmail.com', 10);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'marilda@gmail.com', 11);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'mateus@gmail.com', 12);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'yuri@gmail.com', 13);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'hernani@hotmail.com', 14);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'rosiedfrancisco@gmail.com', 15);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'francisco@gmail.com', 16);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'edson@gmail.com', 17);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'valter@gmail.com', 18);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'evanildo@hotmail.com', 19);
INSERT INTO public.email( descricao, fk_pessoa)VALUES ( 'dulcia@gmail.com', 20);




-- Realizador 

INSERT INTO realizador(fk_pessoa) VALUES (51);
INSERT INTO realizador(fk_pessoa) VALUES (50);
INSERT INTO realizador(fk_pessoa) VALUES (49);
INSERT INTO realizador(fk_pessoa) VALUES (48);
INSERT INTO realizador(fk_pessoa) VALUES (47);
INSERT INTO realizador(fk_pessoa) VALUES (46);
INSERT INTO realizador(fk_pessoa) VALUES (45);
INSERT INTO realizador(fk_pessoa) VALUES (44);
INSERT INTO realizador(fk_pessoa) VALUES (43);
INSERT INTO realizador(fk_pessoa) VALUES (42);
INSERT INTO realizador(fk_pessoa) VALUES (41);
INSERT INTO realizador(fk_pessoa) VALUES (40);
INSERT INTO realizador(fk_pessoa) VALUES (39);
INSERT INTO realizador(fk_pessoa) VALUES (38);
INSERT INTO realizador(fk_pessoa) VALUES (37);
-- Actor

INSERT INTO actor(fk_pessoa) VALUES (36);
INSERT INTO actor(fk_pessoa) VALUES (35);
INSERT INTO actor(fk_pessoa) VALUES (34);
INSERT INTO actor(fk_pessoa) VALUES (33);
INSERT INTO actor(fk_pessoa) VALUES (32);
INSERT INTO actor(fk_pessoa) VALUES (31);
INSERT INTO actor(fk_pessoa) VALUES (30);
INSERT INTO actor(fk_pessoa) VALUES (29);
INSERT INTO actor(fk_pessoa) VALUES (28);
INSERT INTO actor(fk_pessoa) VALUES (27);
INSERT INTO actor(fk_pessoa) VALUES (26);
INSERT INTO actor(fk_pessoa) VALUES (25);
INSERT INTO actor(fk_pessoa) VALUES (24);
INSERT INTO actor(fk_pessoa) VALUES (23);
INSERT INTO actor(fk_pessoa) VALUES (22);
-- Socio

INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (21, 1);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (20, 2);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (19, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (18, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (17, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (16, 2);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (15, 2);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (14, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (13, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (12, 1);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (11, 2);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (10, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (9, 3);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (8, 2);
INSERT INTO socio( fk_pessoa, fk_categoria) VALUES (7, 3);


-- Filme

INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('Velozes & Furiosos 9', 'Velocidade Furiosa 9', 'Não importa o quão veloz você seja, niguém supera o passado. Velozes & Furiosos 9 é o novo capítulo
	da saga que perdura há quase duas décadas e ganhou bilhões em todo mundo.','02:22:00', 15, 2, 2, 2021);
	

INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('Fifty Shades of Grey', 'As Cinquenta Sombras de Grey', 
	'A estudante de literatura Anastasia Steele, de 21 Anos, entrevista o jovem bilionário Christian Grey, como um favor a sua colega de quarto Kate Kavanagh. Ela vê nele um homem atraente e brilhante, e ele fica igualmente fascinado por ela. Embora seja sexualmente inexperiente, Anastasia mergulha de cabeça nessa relação e descobre os prazeres do sadomasoquismo, tornando-se o objeto de submissão do enigmático Grey.'
	,'02:05:00', 14, 5, 5, 2015);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('Five Feet Apart', 'A Distância Entre Nós', 
	'Dois pacientes com fibrose cística se apaixonaram, apesar das regras do hospital afirmarem que eles devem manter 1,5 metros de distância entre si.'
	,'01:57:00', 13, 3, 4, 2019);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('Assim Nasce Uma Estrela', 'Nasce Uma Estrela', 
	'Dois pacientes com fibrose cística se apaixonaram, apesar das regras do hospital afirmarem que eles devem manter 1,5 metros de distância entre si.'
	,'02:15:00', 12, 4, 5, 2018);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('Assim Nasce Uma Estrela', 'Nasce Uma Estrela', 
	'
	Cinderella é uma moça determinada que embarca em uma aventura musical para alcançar seus sonhos. Mas ela não está sozinha nessa empreitada, a garota conta com a ajuda de seu Fado Madrinho e de seus ratinhos.
	'
	,'02:15:00', 12, 1, 13, 2021);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('Emma.', 'Emma.', 
	'
	A amada comédia de Jane Austen sobre encontrar seu par e ter um final é reimaginado nesta deliciosa adaptação para o cinema de EMMA.
	'
	,'02:04:00', 11, 1, 1, 2020);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('The Greatest Showman', 'O Grande Showman', 
	'
	Um showman que tem uma tendência natural de enganar seu público, decide montar um circo na esperança de ficar famoso. Durante sua saga há ainda uma importante questão pendente em sua vida, uma paixão cega pelo cantora Jenny Lind.
	'
	,'01:44:00', 10, 3, 5, 2017);

INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('The Fault In Our Stars', 'A Culpa É Das Estrelas', 
	'
	Por causa da doença, Hazel sempre descartou a ideia de se envolver amorosamente, mas acaba cedendo ao se apaixonar por Augustus. Juntos eles viajam para Amsterdã, onde embarcam em uma jornada inesquecível.
	'
	,'02:06:00', 9, 2, 4, 2014);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('How To Be Single', 'Como Ser Solteira', 
	'
	Alice é uma jovem que acaba de ficar solteira e que, com a ajuda de sua amiga Robin, aprenderá a tirar proveito de seu novo status na cidade de New York, onde todo mundo espera encontrar sua alma gêmea.
	'
	,'01:50:00', 8, 4, 4, 2016);
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('The Greatest Showman', 'O grande Showman', 
	'
	Por causa da doença, Hazel sempre descartou a ideia de se envolver amorosamente, mas acaba cedendo ao se apaixonar por Augustus. Juntos eles viajam para Amsterdã, onde embarcam em uma jornada inesquecível.
	'
	,'03:06:00', 9, 2, 4, 2014);
	
--Filme actor

INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (1, 1, '12-02-2017');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (1, 2, '12-02-2017');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (1, 3, '10-08-2017');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (2, 1, '18-05-2019');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (2, 4, '29-12-2010');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (2, 5, '12-02-2010');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (3, 6, '01-11-2011');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (3, 7, '01-11-2012');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (4, 8, '12-02-2001');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (5, 8, '10-10-2019');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (5, 9, '03-05-2021');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (6, 10, '17-02-2021');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (6, 11, '12-02-2017');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (7, 11, '07-03-2016');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (1, 12, '12-02-2017');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (3, 13, '12-02-2017');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (8, 14, '19-12-2010');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (9, 15, '20-11-2012');
INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (1, 5, '12-02-2017');

-- Alugados

INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('12-12-2020', '13-12-2020', 1, 1, '12-12-2020');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('12-12-2010', '12-01-2011', 1, 2, '12-12-2020');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('12-01-2021', '12-02-2021', 2, 1, '12-01-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('12-02-2011', '12-03-2011', 2, 2, '12-02-2011');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('23-04-2012', '23-05-2012', 3, 3, '23-04-2012');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('25-08-2013', '25-09-2013', 4, 3, '12-12-2013');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('01-03-2021', '01-04-2021', 4, 1, '12-03-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('10-02-2021', '10-03-2021', 4, 2, '10-02-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('15-04-2021', '15-05-2021', 4, 3, '15-04-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('01-05-2021', '01-06-2021', 5, 1, '12-07-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('01-01-2021', '01-02-2021', 6, 4, '12-01-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('15-07-2021', '16-07-2021', 7, 5, '15-07-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('17-08-2021', '19-08-2021', 8, 6, '17-08-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('01-09-2021', '01-10-2021', 9, 7, '01-09-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('28-10-2021', '30-10-2021', 10, 8, '28-10-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('14-11-2021', '19-11-2021', 11, 9, '14-11-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('18-11-2021', '22-11-2021', 11, 10, '18-11-2021');
INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)
	VALUES ('14-12-2021', '19-12-2021', 12, 10, '14-12-2021');


