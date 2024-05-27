create database imo;
use imo;

create table estudante(
	id_estudante int primary key auto_increment,
    email_estudante varchar(100) not null,
    password_estutante varchar(100) not null
);

create table curso(
	id_curso int primary key auto_increment,
    nome_curso varchar(100) not null
);

create table certificados(
	id_certificado int primary key auto_increment,
    nome_aula varchar(100) not null,
    
    id_curso int,
    
    constraint fk_CertificadoCurso
    foreign key(id_curso) references curso(id_curso)
);

create table professor(
	id_professor int primary key auto_increment,
    email_professor varchar(100) not null,
    password_professor varchar(100) not null
);

create table aulas(
	id_aula int primary key auto_increment,
    nome_aula varchar(100) not null,
    data_aula date not null,
    id_professor int,
    id_curso int,
    constraint fk_AulaProfessor
    foreign key(id_professor) references professor(id_professor)
);

create table estudante_curso(
	id_estudante int,
    id_curso int,
    foreign key(id_estudante) references estudante(id_estudante),
    foreign key(id_curso) references curso(id_curso)
);

create table estudante_certificados(
	id_certificado int,
    id_estudante int,
    
    foreign key(id_certificado) references certificados(id_certificado),
    foreign key(id_estudante) references estudante(id_estudante)
);

create table aulas_curso(
	id_aula int,
    id_curso int,
    
    foreign key(id_aula) references aulas(id_aula),
    foreign key(id_curso) references curso(id_curso)
);





