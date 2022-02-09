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



-- Pessoa

INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil)
	VALUES ('Sara Tuma', '000111HA0138', '23-07-2000',1,1,1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES 
( 'Manuel Santos','000222HA0139', '02-03-2000', 6, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Maria Santos','000333HA0130', '02-03-2000', 6, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Fernando Matias','000444HA0131', '23-09-1996', '967135467', 'fernandomatias@hotmail.com', 9, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Filomena Rodrigues','0007777HA013', '07-12-1980', 12, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Sandra Rodrigues','0009999HA013', '23-07-1980', 50, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Isaura Manico','0001999HA010', '26-07-1999', 30, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Creuma Kuzola','0002999HA013', '02-04-2000', 28, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Eufranio Diogo','0003999HA093', '10-03-2001', 26, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Eliana Neto','0004999HA073', '04-03-2000', 45, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Marilda Sungu','0005999HA093', '10-12-2000', 54, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Mateus Escutelo','0006999HA013', '02-10-1998', 52, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Yuri Domingos','0007999HA018', '13-10-1999', 10, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Hernani Manuel','0008999HA003', '05-01-2000', 15, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Rosied Francisco','000919HA010', '09-05-2000', 20, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Francisco Omela','0002199HA013', '30-12-1997', 51, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Edson Gregorio','0002299HA013', '10-10-1999', 52, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Valter Kiala','0002399HA013', '02-06-1999', 53, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Evanildo Tuma','0002499HA013', '17-02-1996', 31, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Dulcia David','0002599HA013', '19-11-1994', 29, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Esperança Domingos','0002699HA010', '11-12-1993', 32, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento,  fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'José Mario','0002699HA011', '23-12-1989', 19, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Benvinda Maria','0002799HA044', '19-05-2000', 35, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Sabina Faria','0002799HA010', '20-08-2000', 36, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Maria Nsuzi','0002899HA010', '30-11-2000', 37, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Geraldo da Costa','0002899HA011', '20-08-1996', 38, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Clemente Eduardo','0002719HA044', '20-07-1997', 39, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Sergio Oscar','0002719HA010', '28-05-1998', 42, 2, 1);

INSERT INTO pessoa(nome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Ana da Cunha','0002793HA055', '20-02-2002',43, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Mirela Miguel','0002749HA010', '22-08-2000', 44, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Clelia Daniel','0002759HA010', '25-11-1994', 45, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Rafaela Ernesto','0002769HA010', '12-08-1997', 46, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento,fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Kiala Afonso','0002779HA010', '13-12-2000', 47, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Quilson Diegues','0002789HA010', '15-07-2002', 48, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Clarice Baba','0002791HA010', '16-02-2000', 49, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Paulina Ester','0002792HA010', '10-10-2002', 51, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Edgar Domingos','0002793HA010', '11-11-1995', 52, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Anna Joice','0002794HA010', '12-12-1994', 53, 1, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Anderson Mario','0002795HA010', '13-01-1993', 54, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'William Levi','0002796HA010', '14-02-1992', 1, 2, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'David Zepeda','0002797HA010', '15-03-1991', 2, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Mariana Torres','0002798HA010', '16-04-1990', 3, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Marisa Rodrigues','0002799HB010', '17-05-1899', 4, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Selena Gomes','0002799HC010', '18-11-2000', 5, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Chris Brown','0002799HD010', '19-06-1999', 6, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Charly Flow','0002799HE010', '20-07-1991', 7, 2, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Yeimy Montoia','0002799FA010', '21-08-1990', 8, 1, 2);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Erick Cruz','0002799HA110', '22-06-1997', 9, 2, 1);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Irma Furacao','0002799HA210', '23-07-1995', 11, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Jessica Pedro','0002799HA310', '24-08-2000', 12, 1, 3);
INSERT INTO pessoa(nome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil) VALUES ( 'Jessy Antonio','0002799HA410', '25-08-2003', 13, 2, 3);
	

	
--               TUDO ACIMA JÁ FOI ADICIONADOS
	
INSERT INTO filme( titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)
	VALUES ('The Greatest Showman', 'O grande Showman', 
	'
	Por causa da doença, Hazel sempre descartou a ideia de se envolver amorosamente, mas acaba cedendo ao se apaixonar por Augustus. Juntos eles viajam para Amsterdã, onde embarcam em uma jornada inesquecível.
	'
	,'03:06:00', 9, 2, 4, 2014);
	

