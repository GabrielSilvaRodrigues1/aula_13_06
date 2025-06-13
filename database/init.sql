create schema fatec;
use fatec;
create table aluno(
    id int primary key auto_increment,
    nome varchar(50),
    genero varchar(10)
);