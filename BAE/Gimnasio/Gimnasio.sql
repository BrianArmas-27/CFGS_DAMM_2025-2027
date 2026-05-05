drop database GimnasioElCachas;
create database GimnasioElCachas;
use GimnasioElCachas;
create table Monitor
(
DNI char(9) primary key,
Nombre varchar(25),
Teléfono int
);
create table Títulos
(
Titulos varchar(100),
IdMonitor char(9),
Primary key (Titulos,IdMonitor),
Foreign key (IdMonitor) references Monitor(DNI)
);
create table Sala
(
CodSala int primary key,
Ubicacion varchar(50) unique,
Área int,
Tipo varchar(50)
);
create table Aparato
(
CodAparato int primary key,
IdSala int,
Descripcion varchar(100),
Precio float(6,2),
Estado varchar(50),
Foreign key (IdSala) references Sala(CodSala) on update cascade
);
create table Pista
(
CodPista int primary key,
Ubicación varchar(20) unique,
Estado varchar(100)
);
create table Socio
(
DNI char(9) primary key,
Nombre varchar(25),
Apellido1 varchar(50),
Apellido2 varchar(50),
Teléfono int,
Dirección varchar(50),
Profesión varchar(50),
Avalista char(9),
Foreign key (Avalista) references Socio(DNI) on update cascade
);
create table Reserva
(
IdSocio char(9),
IdPista int,
Fecha date,
Hora time,
Primary key (IdSocio, IdPista),
Foreign key (IdSocio) references Socio(DNI) on update cascade,
Foreign key (IdPista) references Pista(CodPista) on update cascade
);
create table Clase
(
CodClase int primary key,
IdSala int,
IdMonitor char(9),
Descripción varchar(100),
Hora time,
Día date,
Foreign key (IdSala) references Sala(CodSala) on update cascade,
Foreign key (IdMonitor) references Monitor(DNI) on update cascade
);
create table Asiste
(
IdSocio char(9),
IdClase int,
Primary key (IdSocio, IdClase),
Foreign key (IdSocio) references Socio(DNI) on update cascade,
Foreign Key (IdClase) references Clase(CodClase) on update cascade
);
Show tables;
Describe Monitor;
Describe Títulos;
Describe Sala;
Describe Aparato;
Describe Pista;
Describe Socio;
Describe Reserva;
Describe Clase;
Describe Asiste