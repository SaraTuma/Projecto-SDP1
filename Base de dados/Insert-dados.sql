
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

INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil)
	VALUES ('Sara Tuma', '000111HA0138', '23-07-2000', '9481142117', 'saratuma@gmail.com',1,1,1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Manuel Santos','000222HA0139', '02-03-2000','956134000', 'manuelsantos@gmail.com', 6, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Maria Santos','000333HA0130', '02-03-2000', '923231000', 'mariasantos@gmail.com', 6, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Fernando Matias','000444HA0131', '23-09-1996', '967135467', 'fernandomatias@hotmail.com', 9, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Filomena Rodrigues','0007777HA013', '07-12-1980', '928159234', 'filomenarodrigues@hotmail.com', 12, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Sandra Rodrigues','0009999HA013', '23-07-1980', '945179234', 'sandrarodrigues@gmail.com', 50, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Isaura Manico','0001999HA010', '26-07-1999', '920179234', 'isauramanico@gmail.com', 30, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Creuma Kuzola','0002999HA013', '02-04-2000', '912179234', 'creumamatias@gmail.com', 28, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Eufranio Diogo','0003999HA093', '10-03-2001', '922179234', 'eufraniodiogo@gmail.com', 26, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Eliana Neto','0004999HA073', '04-03-2000', '967179234', 'eliananeto@hotmail.com', 45, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Marilda Sungu','0005999HA093', '10-12-2000', '933179234', 'marildasungu@hotmail.com', 54, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Mateus Escutelo','0006999HA013', '02-10-1998', '944179234', 'mateusescutelo@gmail.com', 52, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Yuri Domingos','0007999HA018', '13-10-1999', '955179234', 'yuridomingos@gmail.com', 10, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Hernani Manuel','0008999HA003', '05-01-2000', '966179234', 'sandrarodrigues@gmail.com', 15, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Rosied Francisco','000919HA010', '09-05-2000', '977179234', 'rosiedfrancisco@gmail.com', 20, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Francisco Omela','0002199HA013', '30-12-1997', '988179234', 'franciscoomela@gmail.com', 51, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Edson Gregorio','0002299HA013', '10-10-1999', '999179234', 'edsongregorio@gmail.com', 52, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Valter Kiala','0002399HA013', '02-06-1999', '900179234', 'valterkiala@hotmail.com', 53, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Evanildo Tuma','0002499HA013', '17-02-1996', '912119234', 'evanildotuma@gmail.com', 31, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Dulcia David','0002599HA013', '19-11-1994', '912229234', 'dulciadavid@gmail.com', 29, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Esperança Domingos','0002699HA010', '11-12-1993', '912339234', 'esperancadomingos@gmail.com', 32, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'José Mario','0002699HA011', '23-12-1989', '912449234', 'josemario@hotmail.com', 19, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Benvinda Maria','0002799HA044', '19-05-2000', '912559234', 'benvindamaria@gmail.com', 35, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Sabina Faria','0002799HA010', '20-08-2000', '912669234', 'sabinafaria@hotmail.com', 36, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Maria Nsuzi','0002899HA010', '30-11-2000', '912669234', 'mariansuzi@hotmail.com', 37, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Geraldo da Costa','0002899HA011', '20-08-1996', '912779234', 'geraldocosta@hotmail.com', 38, 2, 2);

INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Clemente Eduardo','0002719HA044', '20-07-1997', '912889234', 'clementeeduardo@hotmail.com', 39, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Sergio Oscar','0002719HA010', '28-05-1998', '912991134', 'dergiooscar@hotmail.com', 42, 2, 1);

INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Ana da Cunha','0002793HA055', '20-02-2002', '912662234', 'anacunha@gmail.com', 43, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Mirela Miguel','0002749HA010', '22-08-2000', '912663334', 'mirelamiguel@hotmail.com', 44, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Clelia Daniel','0002759HA010', '25-11-1994', '912664434', 'cleliadaniel@hotmail.com', 45, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Rafaela Ernesto','0002769HA010', '12-08-1997', '912665534', 'rafaelaernesto@hotmail.com', 46, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Kiala Afonso','0002779HA010', '13-12-2000', '912666634', 'kialaafonso@hotmail.com', 47, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Quilson Diegues','0002789HA010', '15-07-2002', '912667734', 'quilsondiegues@hotmail.com', 48, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Clarice Baba','0002791HA010', '16-02-2000', '912668834', 'claricebaba@hotmail.com', 49, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Paulina Ester','0002792HA010', '10-10-2002', '912669934', 'paulinaester@hotmail.com', 51, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Edgar Domingos','0002793HA010', '11-11-1995', '912660034', 'edgardomingos@hotmail.com', 52, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Anna Joice','0002794HA010', '12-12-1994', '912669211', 'annajoice@hotmail.com', 53, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Anderson Mario','0002795HA010', '13-01-1993', '912669222', 'andersonmario@hotmail.com', 54, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'William Levi','0002796HA010', '14-02-1992', '912669233', 'williamlevi@hotmail.com', 1, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'David Zepeda','0002797HA010', '15-03-1991', '912669244', 'davidzepeda@hotmail.com', 2, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Mariana Torres','0002798HA010', '16-04-1990', '912669255', 'marianatorres@hotmail.com', 3, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Marisa Rodrigues','0002799HB010', '17-05-1899', '912669266', 'marisarodrigues@hotmail.com', 4, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Selena Gomes','0002799HC010', '18-11-2000', '912669277', 'selenagomes@hotmail.com', 5, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Chris Brown','0002799HD010', '19-06-1999', '912669288', 'chrisbrown@hotmail.com', 6, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Charly Flow','0002799HE010', '20-07-1991', '912669299', 'charlyflow@hotmail.com', 7, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Yeimy Montoia','0002799FA010', '21-08-1990', '912669200', 'yeimymontoia@hotmail.com', 8, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Erick Cruz','0002799HA110', '22-06-1997', '911169234', 'erickcruz@hotmail.com', 9, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Irma Furacao','0002799HA210', '23-07-1995', '922209234', 'irmafuracao@hotmail.com', 11, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Jessica Pedro','0002799HA310', '24-08-2000', '933309234', 'jessicapedro@hotmail.com', 12, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Jessy Antonio','0002799HA410', '25-08-2003', '944409234', 'jessyantonio@hotmail.com', 13, 2, 3);
	
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
	
--               TUDO ACIMA JÁ FOI ADICIONADOS
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('The Greatest Showman', 'A Culpa É Das Estrelas', 
	'
	Por causa da doença, Hazel sempre descartou a ideia de se envolver amorosamente, mas acaba cedendo ao se apaixonar por Augustus. Juntos eles viajam para Amsterdã, onde embarcam em uma jornada inesquecível.
	'
	,'02:06:00', 9, 2, 4, 2014);
	

--Filme actor

-- Alugados
