drop database if exists Gestion2;
create database Gestion2;
use Gestion2;
create table Empleado
(
CodEmpleado int primary key,
NIF varchar(10) unique,
Nombre varchar(30),
Apellidos varchar(50),
FechaContrato date,
Puesto varchar(20),
Sueldo float(5,2),
Calle varchar(20),
Poblacion varchar(30),
CodPostal int
);
create table TlfEmp
(
IdEmp int primary key,
Tlf int,
foreign key (IdEmp) references Empleado(CodEmpleado) on update cascade
);
create table Familiar
(
CodFamiliar int,
IdEmp int,
primary key (CodFamiliar, IdEmp),
NIF_CIF varchar(20),
Direccion varchar(20),
Telefono int
);
create table Cliente
(
CodCliente int primary key,
NIF_CIF varchar(20),
Direccion varchar(20),
Telefono int
);
create table Pedido
(
CodPedido int primary key,
IdCliente int,
IdEmp int,
FechaPedido date,
foreign key (IdCliente) references Cliente(CodCliente) on update cascade,
foreign key (IdEmp) references Empleado(CodEmpleado) on update cascade
);
create table Producto
(
CodProducto int primary key,
Descripcion varchar(40),
Precio float(5,2),
NumExistencias int
);
create table Incluye
(
IdProd int,
IdPed int,
primary key (IdProd,IdPed),
Unidades int,
foreign key (IdProd) references Producto(CodProducto) on update cascade,
foreign key (IdPed) references Pedido(CodPedido) on update cascade
);