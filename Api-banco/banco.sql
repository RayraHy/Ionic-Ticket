-- show databases;
-- SELECT @@autocommit;

 -- drop database db_ticket;
 create database db_ticket;
 use db_ticket;

create table if not exists tb_uf(
cd_uf int not null auto_increment,
sg_uf char(10),
constraint pk_uf
primary key(cd_uf))
engine=InnoDB;
-- Inserção nas tb_uf:
INSERT INTO tb_uf VALUES (1, 'SP');

create table if not exists tb_cidade(
cd_cidade int not null auto_increment,
nm_cidade varchar(45),
cd_uf int,
constraint 
primary key(cd_cidade),
foreign key(cd_uf)
references tb_uf(cd_uf)
 ON DELETE CASCADE 
 ON UPDATE CASCADE)
engine=InnoDB;
-- Inserção nas tb_cidade
INSERT INTO tb_cidade VALUES (1, 'São Vicente', 1);

create table if not exists tb_bairro(
cd_bairro int not null auto_increment,
nm_bairro varchar(45),
cd_cidade int,
constraint pk_bairro
primary key (cd_bairro),
foreign key(cd_cidade)
references tb_cidade(cd_cidade)
 ON DELETE CASCADE 
 ON UPDATE CASCADE)
engine=InnoDB;
-- Inserção nas tb_bairro
INSERT INTO tb_bairro VALUES (1, 'Centro', 1);
insert into tb_bairro (cd_bairro, nm_bairro, cd_cidade) values
(2,	'Vila Margarida', 1),
(3,	'Parque Bitaru',1),
(4,	'Voturuá',	1),
(5,	'Nautica III',	1),
(6,	'Gleba II',	1),
(7,	'Tancredo',	1),
(8,	'Jockey', 1),
(9,	'Cidade Nautica',1),
(10,'Parque das Bandeiras',	1),
(11,'Vila Ema',	1),
(12,'Vila Fatima',	1),
(13,'Samaritá',	1),
(14,'Humaitá',	1),
(15,'Quarentenário',1),
(16,'Rio Branco',	1),
(17,'Itararé',	1),
(18,'Boa Vista',	1),
(19,'Tambores',	1),
(20,'Cascatinha',	1),
(21,'Pompeba',	1),
(22,'Vila Mateo Bei',	1),
(23,'Jardim Irmã Dolores',	1),
(24,'Vila Valença',	1),
(25,'Vila São Jorge',	1),
(26,'Beira Mar',	1),
(27, 'Jardim Guassú',	1),
(28, 'Vila Melo',1);


create table if not exists tb_login(
cd_login int not null auto_increment,
cd_email_login varchar(45),
cd_senha_login varchar (20),
cd_acesso_login int,
constraint pk_login
primary key(cd_login))
engine=InnoDB;
-- Inserção nas tb_login
INSERT INTO tb_login VALUES (1, 'zaratrusca@gmail.com', '124144mxczx.A', 1);
insert into tb_login values
(2,	'emanuellysouza@etec.sp.gov.br',	'Ta9DzP6cGh',	1),
(3,	'eduardaeduardagalvao@etec.sp.gov.br',	'meCs2yw2gx',	1),
(4,	'jaquelinecatarinadarocha@etec.sp.gov.br',	'BIRNxIYHuw',	1),
(5,	'luiztheorocha@etec.sp.gov.br',	'9rdl7IIl57',	1),
(6,	'larissatatianepereira@etec.sp.gov.br',	'qZrHHrHlZr',	2),
(7,	'emily_dasilva@etec.sp.gov.br',	'IjLewubjc1',	2),
(8,	'jessicacatarinafogaca@etec.sp.gov.br',	'JcF2KwKeQp',	2),
(9,	'fatima.stefany.damota@etec.sp.gov.br',	'LsRCy6R5KB',	2),
(10,	'marcelo-silveira71@etec.sp.gov.br',	'pX23I6Pca5',	2),
(11,'levirodrigues@etec.sp.gov.br',	'k5gIeoBd7L',	2),
(12,'igor_edson_assis@etec.sp.gov.br',	'KZOf2dbu9H',	2),
(13,'caiogabrielmelo@etec.sp.gov.br',	'jIZR32FAK8',	2),
(14,'amanda-alves81@etec.sp.gov.br',	'uDqadIAwOR',	2),
(15,'arthurrafaeldamata@etec.sp.gov.br',	'9fIlJsJoWt',	2),
(16,'luana_isabella_dasneves@etec.sp.gov.br',	'pLt5yjxdLn',	2),
(17,'alice_peixoto@etec.sp.gov.br',	'm6K8ZLWHZf',	3),
(18,'mario_goncalves@etec.sp.gov.br',	'GTcpRIIl7m',	3),
(19,'jennifercarolinabarros@etec.sp.gov.br',	'81cTZXSe6O',	3),
(20,'noah_assuncao@etec.sp.gov.br',	'FOpkya7mEL',	3),
(21,'antonio.manuel.viana@etec.sp.gov.br',	'EArbw00e3c',	3),
(22,'teste1@etec.sp.gov.br',	'admin1',	1),
(23,'teste2@etec.sp.gov.br',	'admin2',	2),
(24, 'teste3@etec.sp.gov.br',	'admin3',	3);



create table if not exists tb_integrantes(
cd_integrantes int not null auto_increment,
nm_integrante varchar (100),
cd_login int,
cd_bairro int,
constraint pk_integrantes
primary key(cd_integrantes),
foreign key(cd_bairro)
references tb_bairro(cd_bairro),
foreign key(cd_login)
references tb_login(cd_login)
 ON DELETE CASCADE 
 ON UPDATE CASCADE)
engine=InnoDB;
-- Inserção nas tb_integrantes
INSERT INTO tb_integrantes VALUES (1, 'Zaratrusca', 1, 1);
insert into tb_integrantes values
(2,	'Emanuelly Mariana Souza',	2,	1),
(3,	'Eduarda Eduarda Galvão',	3,	2),
(4,	'Jaqueline Catarina da Rocha',	4,	3),
(5,	'Luiz Theo Erick Rocha',	5,	4),
(6,	'Larissa Tatiane Pereira',	6,	5),
(7,	'Emily Aline Priscila da Silva',	7,	6),
(8,	'Jéssica Catarina Fogaça',	8,	7),
(9,	'Fátima Stefany Vera da Mota',	9,	8),
(10,	'Marcelo Isaac Silveira', 10,	9),
(11,	'Levi Geraldo Thales Rodrigues',	11,	10),
(12,	'Igor Edson Assis',	12,	11),
(13,	'Caio Gabriel Manoel Melo',	13,	12),
(14,	'Amanda Marina Catarina Alves',	14,	13),
(15,	'Arthur Rafael da Mata',	15,	14),
(16,	'Luana Isabella das Neves',	16,	15),
(17,	'Alice Sabrina Peixoto',	17,	16),
(18,	'Mário Manoel Bento Gonçalves',	18,	17),
(19,	'Jennifer Carolina Vitória Barros',	19,	18),
(20,	'Noah Lucca Miguel Assunção',	20,	19),
(21,	'Antonio Manuel Viana',	21,	20),
(22,	'teste1teste',	22,	1),
(23,	'teste2teste',	23,	2),
(24,	'teste3teste',	24,3);


create table if not exists tb_telefone(
cd_telefone int not null auto_increment,
cd_numero1 varchar (20),
cd_integrantes int,
constraint pk_telefone
primary key(cd_telefone),
foreign key(cd_integrantes)
references tb_integrantes(cd_integrantes)
 ON DELETE CASCADE 
 ON UPDATE CASCADE)
engine=InnoDB;
-- Inserção nas tb_telefone
INSERT INTO tb_telefone VALUES (1, '32883090', 1);
insert into tb_telefone values
(2,	'99469-4443',	2),
(3,	'99602-0061',	3),
(4,	'99364-1565',	4),
(5,	'98284-4749',	5),
(6,	'98188-4933',	6),
(7,	'98347-7891',	7),
(8,	'98720-7658',	8),
(9,	'99207-3193',	9),
(10,'98293-9141',	10),
(11,'98101-7380',	11),
(12,'98547-9028',	12),
(13,'98166-4411',	13),
(14,'99190-6968',	14),
(15,'99957-0080',	15),
(16,'98317-8222',	16),
(17,'98565-2397',	17),
(18,'99984-0410',	18),
(19,'98728-8976',	19),
(20,'98898-0122',	20),
(21,'99864-2829',	21),
(22,'99999-9999',	22),
(23,'99999-9998',	23),
(24,'99999-9997',	24);


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
(2,	'ativo',	'elisa-darocha74@etec.sp.gov.br',	'30sxy1bMnp',	'74600375084'	,'Elisa Rita'),
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


  create table if not exists tb_descricao_ticket(
    cd_descricao_ticket int not null auto_increment,
    conteudo varchar(500),
    dt_atualizacao_descriacao date,
    hr_atualizacao_descricao datetime,
    constraint pk_descricao_ticket
    primary key(cd_descricao_ticket))
    engine=InnoDB;
    -- Inserção nas tb_descricao_ticket
    INSERT INTO tb_descricao_ticket VALUES (1, 'Falta de água nas torneiras', '2023-01-23', '8:10:09');
    
    create table if not exists tb_avaliacao_atendimento(
	cd_avaliacao_atendimento int not null auto_increment,
	descricao_atendimento varchar (100),
	constraint pk_avaliacao_atendimento
	primary key(cd_avaliacao_atendimento))
	engine=InnoDB;
    -- Inserção nas tb_avaliacao_atendimento
    INSERT INTO tb_avaliacao_atendimento VALUES (1, 'Ótima');
    
      create table if not exists tb_cor_ticket(
    cd_cor_ticket int not null auto_increment,
    nm_cor varchar(50),
    constraint pk_cor_ticket
    primary key(cd_cor_ticket))
    engine=InnoDB;
     -- Inserção nas tb_cor_ticket
    INSERT INTO tb_cor_ticket VALUES (1, 'Vermelho');
    INSERT INTO tb_cor_ticket VALUES (2, 'Amarelo');
    
    create table if not exists tb_gravidade_ticket(
    cd_gravidade_ticket int not null auto_increment,
    nm_gravidade_ticket varchar(50),
    cd_cor int,
    constraint pk_gravidade_ticket
    primary key(cd_gravidade_ticket))
    engine=InnoDB;
 -- Inserção nas tb_gravidade_ticket
    INSERT INTO tb_gravidade_ticket VALUES (1, 'Urgente', 1);
    
    create table if not exists tb_status_ticket(
	cd_status_ticket int not null auto_increment,
	descricao_ticket varchar(50),
	constraint pk_status_ticket
	primary key(cd_status_ticket))
	engine=InnoDB;
     -- Inserção nas tb_status_ticket
    INSERT INTO tb_status_ticket VALUES (1, 'Concluido');
    
create table if not exists tb_ticket(
cd_ticket int not null auto_increment,
cd_descricao_ticket int,
dt_data_inicio date,
dt_data_fim date,
hr_data_inicio datetime,
hr_data_fim datetime,
cd_atendente int,
cd_integrantes int,
cd_gravidade_ticket int,
cd_status_ticket int,
cd_avaliacao_atendimento int,
constraint pk_ticket
primary key(cd_ticket),
foreign key(cd_atendente)
references tb_atendente(cd_atendente),
foreign key(cd_descricao_ticket)
references tb_descricao_ticket(cd_descricao_ticket),
foreign key(cd_integrantes)
references tb_integrantes(cd_integrantes),
foreign key(cd_gravidade_ticket)
references tb_gravidade_ticket(cd_gravidade_ticket),
foreign key(cd_avaliacao_atendimento)
references tb_avaliacao_atendimento(cd_avaliacao_atendimento),
foreign key(cd_status_ticket)
references tb_status_ticket(cd_status_ticket)
 ON DELETE CASCADE 
 ON UPDATE CASCADE)
engine=InnoDB;
 -- Inserção nas tb_ticket
    INSERT INTO tb_ticket VALUES (1, 1, '2017-01-22', '2017-01-23', '12:10:09', '16:10:09', 1, 1, 1, 1, 1);

create table if not exists tb_etec(
cd_etec int not null auto_increment,
nm_instituicao varchar(45),
cd_telefone varchar (20),
cd_cep varchar(20),
sg_uf char (2),
nm_bairro varchar (50),
nm_logradourado varchar (50),
cd_atendente int,
cd_integrantes int,
constraint pk_etec
primary key(cd_etec),
foreign key(cd_integrantes)
references tb_integrantes(cd_integrantes),
foreign key(cd_atendente)
references tb_atendente(cd_atendente))
engine=InnoDB;
-- Inserção nas tb_etec
INSERT INTO tb_etec VALUES (1, 'Etec Doutora Ruth Cardoso', '39870962', '11310-020', 'SP', 'Centro', 'Pr.Cel. Lopes, 387', 1, 1);

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