drop database Agencia;
create database Agencia;
use Agencia;
create table Cliente 
(
CodCli int primary key, 
DNI varchar(10) not null unique, 
Nombre varchar(50), 
Telefono varchar(12) unique, 
Direccion varchar(50), 
Avalista int, 
foreign key(Avalista) references Cliente(CodCli) on update cascade
);
create table Garaje
(
CodGaraje int primary key,
Telefono varchar(12),
Capacidad int check(Capacidad between 10 and 500),
Dirección varchar(50),
Ciudad varchar(50) default"Las Palmas"
);
create table coche
(
CodCoche int primary key,
Matricula varchar(12) not null unique,
Modelo varchar(50),
Color varchar(50),
Marca varchar(50),
IdGaraje int,
foreign key(IdGaraje) references Garaje(CodGaraje) on update cascade
);
create table Agencia
(
CodAgencia int primary key,
otro varchar(50)
);
create table tlf_agencia
(
IdAgencia int,
Telefono varchar(20),
primary key (IdAgencia,Telefono),
foreign key(IdAgencia) references Agencia(CodAgencia) on update cascade
);
create table reserva
(
CodReserva int,
IdCli int,
FechaIn date default(curdate()),
FechaFin date default (curdate()),
IdAgencia int,
primary key(CodReserva,IdCli),
foreign key(IdCli) references Cliente(CodCli) on update cascade,
foreign key(IdAgencia) references Agencia(CodAgencia) on update cascade
);
create table Alquiler
(
IdReserva int,
IdCli int,
IdCoche int,
Precio int,
Entregado boolean,
primary key(IdReserva,IdCli,IdCoche),
foreign key (IdCli,IdReserva) references Reserva(IdCli,CodReserva) on update cascade,
foreign key (IdCoche) references Coche(CodCoche)
)