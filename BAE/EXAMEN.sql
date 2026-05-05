drop database if exists CampeonatoAjedrez;
create database CampeonatoAjedrez;
use CampeonatoAjedrez;
create table Municipio
(
CodCorr int primary key,
Nombre varchar(30),
NumClub int,
isla varchar(20),
Representa int,
foreign key (Representa) references Municipio(CodCorr) on update cascade
);
create table Hotel
(
CodHotel int primary key,
Direccion varchar (50),
Nombre varchar(50)
);
create table TLF_Hotel
(
IdHotel int,
Telefono int,
primary key (IdHotel,Telefono),
foreign key (IdHotel) references Hotel(CodHotel) on update cascade
);
create table Participante
(
CodParticipante int primary key,
DNI varchar(12) unique,
Nombre varchar(20),
Telefono int unique,
FechaNac date,
IdMun int,
IdHotel int,
FechaEnt date,
Gastos double (4,2),
foreign key (IdMun) references Municipio(CodCorr) on update cascade,
foreign key (IdHotel) references Hotel(CodHotel) on update cascade
);
create table Jugador
(
IdJugador int primary key,
Nivel int check (Nivel between 1 and 10),
Edad int,
foreign key (IdJugador) references Participante(CodParticipante) on update cascade
);
create table Arbitro
(
IdArbitro int primary key,
AnosExp int,
foreign key (IdArbitro) references Participante(CodParticipante) on update cascade
);
create table Partida
(
CodPartida int primary key,
Fecha date,
Resultado varchar(50),
IdBlancas int,
IdNegras int,
IdArbitro int,
foreign key (IdArbitro) references Participante(CodParticipante) on update cascade,
foreign key (IdBlancas,IdNegras) references Participantes(CodParticipante) on update cascade
);
create table Movimientos
(
IdPartida int,
Movimiento varchar(10),
Comentario varchar(50),
Salida varchar(50),
primary key (IdPartida,Movimiento)
foreign key (IdPartida) references Id
);