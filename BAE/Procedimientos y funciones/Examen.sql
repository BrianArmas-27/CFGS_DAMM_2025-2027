-- EXAMEN BAE 2ª EVAL -- 
create database if not exists IESRINCON;
use IESRINCON; 
create table if not exists ALUMNOS 
(
CodAlum int primary key auto_increment,
NIF char(9) unique not null,
Nombre varchar(50),
Ape varchar(50),
Ciudad varchar(100) default('LAS PALMAS DE G.C.'),
FechaNac date not null,
Tlf int,
Repetidor boolean default(FALSE) 
);
describe ALUMNOS;
insert into ALUMNOS(NIF,Nombre,Ape,Ciudad,FechaNac,Tlf,Repetidor) values('11223344A','Marcos','Batista','TEROR','2002-02-12',678145211,TRUE), ('66778899B','Juan','González','ARUCAS','2003-02-14',null,FALSE), ('11663344G','Ana','Santana','GALDAR','2003-08-18',671445566,FALSE);
select * from alumnos;
create table if not exists MODULOS
(
CodMod char(2) primary key,
Siglas char(3) unique not null,
Titulo varchar(30) unique,
Nhoras int,
check(Nhoras between 60 and 224)
);
describe MODULOS;
insert into MODULOS(CodMod,Siglas,Titulo,Nhoras) values('M1','BAE','Base de Datos',192), ('M2','PRO','Programación',216),('M3','LNT','Inglés',60);
select * from modulos;
create table if not exists NOTAS
(
IdAlum int,
IdMod char(2),
Nota float(4,2),
check(Nota between 0 and 10),
primary key(IdAlum,IdMod),
foreign key (IdAlum) references ALUMNOS(CodAlum) on update cascade,
foreign key (IdMod) references MODULOS(CodMod) on update cascade
);
describe NOTAS;
insert into NOTAS 
values(1,'M1',5.25),(1,'M2',6.8),(1,'M3',9),
(2,'M1',6.5),(2,'M2',4.35),(2,'M3',5),
(3,'M1',7.65),(3,'M2',9.5),(3,'M3',10);
select * from notas;
alter table ALUMNOS add email varchar(100);
describe ALUMNOS;
update ALUMNOS 
set email='anita2003@gmail.com'
where Nombre='Ana';
select * from ALUMNOS;
update ALUMNOS
set email=concat(lower(trim(nombre)),lower(trim(left(ape,3))),year(FechaNac),'@ieselrincon.es')
where email is null or email = '';
select * from ALUMNOS;
alter table NOTAS
modify column nota int;
describe NOTAS;
create view NotasBAE (Alumnos,Notas)
as Select concat(trim(nombre),' ',trim(ape)) as 'Nombre completo',nota from Notas as n join alumnos as a on a.codAlum=n.idAlum
where idMod in (select codmod from modulos where Siglas='BAE');
select * from NotasBAE;
delete from Notas
where IdAlum in (select codAlum from alumnos where concat(trim(nombre),' ',trim(ape))='Marcos Batista');
delete from Alumnos
where concat(trim(nombre),' ',trim(ape))='Marcos Batista';
select * from alumnos;
select * from notas;
drop table notas;