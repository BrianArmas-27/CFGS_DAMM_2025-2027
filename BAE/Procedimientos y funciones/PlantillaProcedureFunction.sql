-- Plantilla --
-- Este código NO funciona. Es solo un ejemplo --
use basededatostopechula;
-- Procedures --
drop procedure if exists ejemplo1;
delimiter $$
-- variableNormalEntrada y variableEntrada son EXACTAMENTE lo mismo, pq IN es el parámetro por defecto. ChatGPT te pone IN en la respuesta... --
-- Las funciones solo tienen variables de entrada --
create procedure ejemplo1(variableNormalEntrada varchar(67), IN variableEntrada varchar(69), OUT variableSalida int) 
begin
-- Anywho's... --
end $$
delimiter ;
call ejemplo1(Normal,InNormal,@OutNormal);
-- Si se le asignan varios valores a OutNormal (varchar, int, date...), los enseña por pestañas --
select @OutNormal;
-- Functions --
drop function if exists ejemplo2;
delimiter $$
-- La función ES la variable de salida --
create function ejemplo2(pVariable int) returns text
deterministic -- Esto hace que devuelva la misma respuesta si tiene los mismos parametros --
begin
-- Anywho's... --
end $$
delimiter ;
select ejemplo2(420);