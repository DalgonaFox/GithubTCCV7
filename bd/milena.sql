CREATE DATABASE tcc;
USE tcc;

#Cursos
create table curso (
cod_curso int primary key auto_increment,
nome_curso varchar (255) not null,
tipo_curso varchar (255) not null,
turno varchar (255) not null
);

#Turmas
create table turma (
 cod_turma int primary key auto_increment,
 nome_turma varchar (20) not null UNIQUE,
 cod_curso int not null,
 constraint foreign key (cod_curso) references curso (cod_curso)
 );
 
 create table genero (
 cod_genero int primary key not null,
 nome_genero varchar (18) not null UNIQUE
 );
 

#Aluno
create table aluno (
rm int (4) primary key, 
nome_aluno varchar (255) not null,
cpf  varchar (11) not null UNIQUE,
data_nasc date not null,
email_aluno varchar (255) not null UNIQUE,
senha varchar (8) not null,
tel_aluno varchar (11) not null UNIQUE,
primeiro_acesso boolean default true,
cod_genero int not null,
constraint foreign key (cod_genero) references genero (cod_genero),
cod_curso int not null,
constraint foreign key (cod_curso) references curso (cod_curso),
cod_turma int not null,
constraint foreign key (cod_turma) references turma (cod_turma)
);

create table responsavel (
cod_resp int primary key auto_increment,
nome_resp varchar (255) not null,
email_resp varchar (255) not null UNIQUE,
tel_resp varchar (11) not null UNIQUE
);

create table empresa (
cod_empresa int primary key auto_increment,
nome_empresa varchar (255) not null,
email_empresa varchar (255) not null UNIQUE,
tel_empresa varchar (11) not null UNIQUE
);

create table inforesp (
cod_inforesp int primary key auto_increment,
rm int (4) not null,
constraint foreign key (rm) references aluno (rm),
cod_resp int not null,
constraint foreign key (cod_resp) references responsavel (cod_resp)
);

create table infotrabalho (
cod_trabalho int primary key auto_increment,
rm int (4) not null,
constraint foreign key (rm) references aluno (rm),
cod_empresa int not null,
constraint foreign key (cod_empresa) references empresa (cod_empresa)
);

#Gestão
create table gestor(
nif int primary key,
nome_gestor varchar (250) not null,
email_gestor varchar(255) not null UNIQUE,
senha varchar (8) not null,
tel_gestor varchar (11) not null UNIQUE,
cargo varchar(255) not null,
primeiro_acesso boolean default true,
cod_genero int not null,
constraint foreign key (cod_genero) references genero (cod_genero)
);

#Outros
create table requisicao (
cod_req int primary key auto_increment,
rm int not null,
constraint foreign key (rm) references aluno (rm),
cod_turma int not null,
constraint foreign key (cod_turma) references turma (cod_turma),
data_saida date not null,
hora_saida time not null,
justificativa varchar (255) not null,
ciencia_gestor boolean not null
);

create table justsaida (
cod_saida int primary key auto_increment,
cod_req int not null,
constraint foreign key (cod_req) references requisicao (cod_req),
rm int not null,
constraint foreign key (rm) references aluno (rm),
observacao varchar (255) not null,
arquivo longblob not null,
ciencia_gestor boolean not null,
data_envio date not null
);

create table justfalta (
cod_falta int primary key auto_increment,
rm int not null,
constraint foreign key (rm) references aluno (rm),
cod_turma int not null,
constraint foreign key (cod_turma) references turma (cod_turma),
data_emissao date not null,
data_inicio date not null,
data_termino date not null,
observacao varchar (255) not null,
arquivo longblob not null,
ciencia_gestor boolean not null,
data_envio date not null
);




#///////////////////////////
INSERT INTO genero (cod_genero, nome_genero) values
(1, 'Masculino'),
(2, 'Feminino'),
(3, 'Prefiro não dizer');
 
INSERT INTO curso (nome_curso, tipo_curso, turno) VALUES 
('Engenharia da Computação', 'Bacharelado', 'Manhã'),
('Administração', 'Bacharelado', 'Noite'),
('Direito', 'Bacharelado', 'Tarde');

INSERT INTO turma (nome_turma, cod_curso) VALUES 
('Turma A', 1),
('Turma B', 2),
('Turma C', 3);

INSERT INTO aluno (rm, nome_aluno, cpf, data_nasc, cod_genero, email_aluno, senha, tel_aluno, cod_curso, cod_turma) VALUES 
(1001, 'Pedro Costa', '23456789012', '2010-07-19', 1, 'pedro.costa@mail.com', 'senha123', '21999999999', 1, 1),
(1002, 'Maria Silva', '12345678901', '2009-05-15', 2, 'maria.silva@mail.com', 'senha456', '21988888888', 2, 2),
(1003, 'Lucas Almeida Jr', '34567890123', '2011-09-21', 1, 'lucas.almeida.jr@mail.com', 'senha789', '21977777777', 3, 3),
(1004, 'João Pereira', '45678901234', '2008-03-10', 1, 'joao.pereira@mail.com', 'senha012', '21966666666', 1, 1),
(1005, 'Fernanda Oliveira Jr', '56789012345', '2007-11-30', 2, 'fernanda.oliveira.jr@mail.com', 'senha345', '21955555555', 2, 2),
(1006, 'Juliana Ferreira', '67890123456', '2009-04-05', 2, 'juliana.ferreira@mail.com', 'senha678', '21944444444', 3, 3),
(1007, 'Roberto Souza Jr', '78901234567', '2010-12-18', 3, 'roberto.souza.jr@mail.com', 'senha901', '21933333333', 1, 1),
(1008, 'Mariana Lima Jr', '89012345678', '2008-07-07', 3, 'mariana.lima.jr@mail.com', 'senha234', '21922222222', 2, 2),
(1009, 'Ricardo Mendes Jr', '90123456789', '2011-10-13', 1, 'ricardo.mendes.jr@mail.com', 'senha567', '21911111111', 3, 3),
(1010, 'Patricia Rocha Jr', '01234567890', '2007-02-22', 2, 'patricia.rocha.jr@mail.com', 'senha890', '21900000000', 1, 1);

INSERT INTO responsavel (nome_resp, email_resp, tel_resp) VALUES 
('Ana Costa', 'ana.costa@mail.com', '21987654321'),
('José Silva', 'jose.silva@mail.com', '21987654322'),
('Lucas Almeida', 'lucas.almeida@mail.com', '21987654323'),
('Fernanda Oliveira', 'fernanda.oliveira@mail.com', '21987654324'),
('Carlos Pereira', 'carlos.pereira@mail.com', '21987654325'),
('Juliana Ferreira', 'juliana.ferreira@mail.com', '21987654326'),
('Roberto Souza', 'roberto.souza@mail.com', '21987654327'),
('Mariana Lima', 'mariana.lima@mail.com', '21987654328'),
('Ricardo Mendes', 'ricardo.mendes@mail.com', '21987654329'),
('Patricia Rocha', 'patricia.rocha@mail.com', '21987654330');

INSERT INTO empresa (nome_empresa, email_empresa, tel_empresa) VALUES 
('Tech Solutions', 'contato@techsolutions.com', '2133322233'),
('Advocacia Silva', 'contato@advocaciasilva.com', '2133322234'),
('InovaTech', 'contato@inovatech.com', '2133322235'),
('Consultoria Oliveira', 'contato@consultoriaoliveira.com', '2133322236'),
('Desenvolve TI', 'contato@desenvolveti.com', '2133322237'),
('Global Solutions', 'contato@globalsolutions.com', '2133322238'),
('Segurança Total', 'contato@segurancatotal.com', '2133322239'),
('Finance Corp', 'contato@financecorp.com', '2133322240'),
('Logística Avançada', 'contato@logisticaavancada.com', '2133322241'),
('Indústria Forte', 'contato@industriaforte.com', '2133322242');

INSERT INTO inforesp (rm, cod_resp) VALUES 
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 4);

INSERT INTO infotrabalho (rm, cod_empresa) VALUES 
(1006, 5),
(1007, 6),
(1008, 7),
(1009, 8),
(1010, 9);

INSERT INTO gestor (nif, nome_gestor, email_gestor, senha, tel_gestor, cargo, cod_genero) VALUES 
(101, 'João Souza', 'joao.souza@mail.com', 'senha789', '21977777777', 'Coordenador', 1),
(102, 'Luciana Lima', 'luciana.lima@mail.com', 'senha321', '21966666666', 'Diretora', 2);

INSERT INTO requisicao (rm, cod_turma, data_saida, hora_saida, justificativa, ciencia_gestor) VALUES 
(1001, 1, '2024-09-12', '14:00:00', 'Consulta médica', TRUE),
(1002, 2, '2024-09-11', '10:00:00', 'Compromisso familiar', TRUE);

INSERT INTO justsaida (cod_req, rm, observacao, ciencia_gestor, data_envio) VALUES 
(1, 1001, 'Saída para consulta médica aprovada.', FALSE, '2024-09-13'),
(2, 1002, 'Compromisso familiar justificado.', FALSE, '2024-09-13');

INSERT INTO justfalta (rm, cod_turma, data_emissao, data_inicio, data_termino, observacao, ciencia_gestor, data_envio) VALUES 
(1003, 1, '2024-09-10', '2024-09-08', '2024-09-10', 'Falta justificada por motivos de saúde.', FALSE, '2024-09-10'),
(1004, 2, '2024-09-12', '2024-09-11', '2024-09-12', 'Falta justificada por compromissos familiares.', FALSE, '2024-09-12');

INSERT INTO aluno (rm, nome_aluno, cpf, data_nasc, cod_genero, email_aluno, senha, tel_aluno, cod_curso, cod_turma) VALUES 
(1011, 'Milena Oliveira', '41112223334', '2005-11-03', 2, 'milena.oliveira@mail.com', 'milena12', '12234567890', 3, 3);

INSERT INTO aluno (rm, nome_aluno, cpf, data_nasc, cod_genero, email_aluno, senha, tel_aluno, cod_curso, cod_turma) VALUES 
(1012, 'Sabrina Oliveira', '11122233145', '2005-11-03', 2, 'sabrina.oliveira@mail.com', 'sabrina1', '12234567891', 3, 3);

INSERT INTO aluno (rm, nome_aluno, cpf, data_nasc, cod_genero, email_aluno, senha, tel_aluno, cod_curso, cod_turma) VALUES 
(1013, 'Sabrina Vilela', '11122233345', '2005-11-03', 2, 'sabrina.vilela@mail.com', 'sabrina1', '12234567830', 3, 3);