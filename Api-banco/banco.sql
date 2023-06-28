-- show databases;
-- SELECT @@autocommit;

-- drop database db_ticket;
 create database db_ticket;
 use db_ticket;

create table if not exists tb_integrantes(
cd_integrantes int not null auto_increment,
nm_integrante varchar (100),
cd_email_integrante varchar(45),
cd_senha_integrante varchar (20),
cd_numero1 varchar (20),
cd_CEP varchar (11),
constraint pk_integrantes
primary key(cd_integrantes))
engine=InnoDB;
-- Inserção nas tb_integrantes
insert into tb_integrantes values
(2,	'Emanuelly Mariana Souza','Ray@', '123',	'99469-4443',	'12345678912'),
(3,	'Eduarda Eduarda Galvão','emanuellysouza@etec.sp.gov.br',	'Ta9DzP6cGh','99469-4443',	'12345678912'),
(4,	'Jaqueline Catarina da Rocha', 'eduardaeduardagalvao@etec.sp.gov.br',	'meCs2yw2gx','99469-4443',	'12345678912'),
(5,	'Luiz Theo Erick Rocha', '', '','99469-4443',	'12345678912'),
(6,	'Larissa Tatiane Pereira', '', '','99469-4443',	'12345678912'),
(7,	'Emily Aline Priscila da Silva', '', '','99469-4443',	'12345678912'),
(8,	'Jéssica Catarina Fogaça', '', '','99469-4443',	'12345678912'),
(9,	'Fátima Stefany Vera da Mota', '', '','99469-4443',	'12345678912'),
(10,'Marcelo Isaac Silveira', '', '','99469-4443',	'12345678912'),
(11,'Levi Geraldo Thales Rodrigues', '', '','99469-4443',	'12345678912'),
(12,'Igor Edson Assis', '', '','99469-4443',	'12345678912'),
(13,'Caio Gabriel Manoel Melo', '', '','99469-4443',	'12345678912'),
(14,'Amanda Marina Catarina Alves', '', '','99469-4443',	'12345678912'),
(15,'Arthur Rafael da Mata', '', '','99469-4443',	'12345678912'),
(16,'Luana Isabella das Neves',  '', '','99469-4443',	'12345678912'),
(17,'Alice Sabrina Peixoto', '', '','99469-4443',	'12345678912'),
(18,'Mário Manoel Bento Gonçalves', '', '','99469-4443',	'12345678912'),
(19,'Jennifer Carolina Vitória Barros', '', '','99469-4443',	'12345678912'),
(20,'Noah Lucca Miguel Assunção', '', '','99469-4443',	'12345678912'),
(21,'Antonio Manuel Viana', '', '','99469-4443',	'12345678912'),
(22,'teste1teste', '', '','99469-4443',	'12345678912'),
(23,'teste2teste', '', '','99469-4443',	'12345678912'),
(24,'teste3teste', '', '','99469-4443',	'12345678912');

create table if not exists tb_atendente(
cd_atendente int not null auto_increment,
status_atendente varchar (50),
cd_email_atendente varchar(45),
cd_senha_atendente varchar (20),
cd_cpf varchar (13),
nm_atendente varchar (75),
constraint pk_atendente
primary key(cd_atendente))
engine=InnoDB;
-- Inserção nas tb_atendente
INSERT INTO tb_atendente VALUES (1, 'ativo', 'jamesclear@gmail.com', 'JS2382d.', '76022010861', 'James Clear');
insert into tb_atendente values
(2,	'ativo',	'Ray@',	'123',	'74600375084'	,'Elisa Rita'),
(3,	'ativo',	'davi_tiago_nunes@etec.sp.gov.br',	'poi6kbJlFz',	'26912354670',	'Davi Tiago Nunes'),
(4,	'ativo',	'eliane.tatiane.daluz@etec.sp.gov.br',	'B6WCbDumP5',	'66444543800',	'Eliane Tatiane da Luz'),
(5,	'ativo', 'diogo-figueiredo81@etec.sp.gov.br',	'5ZFij3j7xw',	'78003992303',	'Diogo Samuel Ryan Figueiredo'),
(6,	'ativo',	'gabriel_leandro_martins@etec.sp.gov.br',	'1btnPcZK1y',	'82354518323',	'Gabriel Leandro Manoel Martins'),
(7,	'ativo',	'priscila-baptista87@etec.sp.gov.br',	'Tl9DC6xDGM',	'40384715869',	'Priscila Sabrina Aurora Baptista'),
(8,	'ativo',	'henrique_porto@etec.sp.gov.br',	'4dROzl7aoR',	'16617253841',	'Henrique Renan Porto'),
(9,	'ativo',	'marcos_vinicius_dasneves@etec.sp.gov.br',	'aYO9CW8GN3',	'77891257108',	'Marcos Vinicius Alexandre Daniel das Neves'),
(10,	'ativo',	'elainepietrabrito@etec.sp.gov.br',	'ngrBsTnej1',	'27741415409',	'Elaine Pietra Julia Brito'),
(11,	'ativo',	'yasmin.marlene.caldeira@etec.sp.gov.br',	'1X2wseUu0B',	'88955487100',	'Yasmin Marlene Caldeira'),
(12,	'ativo',	'isabelly-aparicio84@etec.sp.gov.br',	'U1Qnla3bd2',	'32221463498',	'Isabelly Camila Aparício'),
(13,	'ativo',	'jessica_amanda@etec.sp.gov.br',	'fPgHk2yaQM',	'41792771908',	'Jéssica Amanda Fabiana Fernandes'),
(14,	'ativo',	'enzo-vieira94@etec.sp.gov.br',	'pXcX1hLpTx',	'86828133781',	'Enzo Benício Fábio Vieira'),
(15,	'ativo',	'francisco-monteiro82@etec.sp.gov.br',	'MF4tZjXtjb',	'11967478813',	'Francisco Danilo Nicolas Monteiro'),
(16,	'ativo',	'estergiovannamendes@etec.sp.gov.br',	'jmf2gPWmG9',	'1049676906',	'Ester Giovanna Rebeca Mendes'),
(17,	'ativo',	'leticia_francisca_teixeira@etec.sp.gov.br',	'DYOxXJouRw',	'7943309758',	'Letícia Francisca Teresinha Teixeira'),
(18,	'desativado',	'anderson.thiago.freitas@etec.sp.gov.br',	'aLWX8TFrt4',	'29536731304',	'Anderson Thiago Gabriel Freitas'),
(19,	'desativado',	'kamilly-farias82@etec.sp.gov.br',	'8rJqJfXtoB',	'6206205010',	'Kamilly Isabelly Beatriz Farias'),
(20,	'desativado',	'stella_dacosta@etec.sp.gov.br',	'uCxzI7A7BE',	'51290755442',	'Stella Sueli Alana da Costa'),
(21,	'ativo',	'rafaela_luiza_dacunha@etec.sp.gov.br',	'pFwsNs6xME',	'24755893020',	'Rafaela Luiza Fernanda da Cunha');


  
create table if not exists tb_ticket(
cd_ticket int not null auto_increment,
ds_descricao_ticket varchar(100),
dt_data_inicio date,
dt_data_fim date,
hr_data_inicio datetime,
hr_data_fim datetime,
cd_atendente int,
cd_integrantes int,
ds_gravidade_ticket varchar(50),
ds_status_ticket varchar(50),
constraint pk_ticket
primary key(cd_ticket))
engine=InnoDB;
 -- Inserção nas tb_ticket
INSERT INTO tb_ticket VALUES (1, 'czcsda', '2017-01-22', '2017-01-23', '12:10:09', '16:10:09', 1, 1, 'sdfs', 'sdf');
INSERT INTO tb_ticket VALUES (3, 'Torneira quebrada', '2023-05-23', '2017-05-24', '12:10:09', '09:00:09', 1, 1, 'Medio', 'Concluido');
INSERT INTO tb_ticket VALUES 
(4, 'Descarga diparada', '2023-06-24', '2023-06-25', '12:10:09', '10:10:00', 2, 4, 'Altissima', 'Em andamento'),
(5, 'Torneira bebedouro', '2023-06-23', '2023-06-23', '11:10:09', '12:00:09', 3, 4, 'Alta', 'Em andamento'),
(6, 'Ventilador Danificado ', '2023-06-23', '2017-06-24', '10:11:00', '12:00:00', 4, 2, 'Alta', 'Em andamento'),
(7, 'Goteira na Sala 4', '2023-06-27', '0000-00-00', '12:10:09', '00:00:00', 5, 6, 'Alta', 'Aberta'),
(8, 'Tomada dando Choque', '2023-06-27', '0000-00-00', '11:07:09', '00:00:09', 5, 4, 'Altissima', 'Aberta');



UPDATE tb_ticket
SET ds_status_ticket = 'Descarga disparada'
WHERE cd_ticket IN (1);	

select * from tb_ticket;

select inte.nm_integrante as 'Nome do integrante', log.cd_email_login as 'E-mail do integrante', des.conteudo as 'Descrição do Ticket', ate.nm_atendente as 'Nome do atendente', ate.cd_email_atendente as 'E-mail Atendente', ate.status_atendente as 'Status do atendente', ava.descricao_atendimento as 'Descrição do atendimento', ete.nm_instituicao as 'Nome da instituiçaõ', gra.nm_gravidade_ticket as 'Gravidade do Ticket'
from tb_etec as ete 
join tb_atendente as ate
on ate.cd_atendente = ete.cd_atendente
join tb_integrantes as inte
on inte.cd_integrantes = ete.cd_integrantes
join tb_login as log
on log.cd_login = inte.cd_login
, 
tb_descricao_ticket as des

join  tb_ticket as tik
on tik.cd_descricao_ticket = des.cd_descricao_ticket

join tb_avaliacao_atendimento as ava
on ava.cd_avaliacao_atendimento = tik.cd_avaliacao_atendimento

join tb_gravidade_ticket as gra
on gra.cd_gravidade_ticket = tik.cd_gravidade_ticket;

-- drop database db_ticket;

SELECT * FROM tb_integrantes;