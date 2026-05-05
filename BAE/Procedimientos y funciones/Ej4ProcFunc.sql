drop function if exists dia;
drop function if exists mes;
drop function if exists fecha_hora;
delimiter $$
create function dia(inNumero int) returns text
deterministic
begin
	Case inNumero
		when 0 then return 'Lunes';
        when 1 then return 'Martes';
        when 2 then return 'Miercoles';
        when 3 then return 'Jueves';
        when 4 then return 'Viernes';
        when 5 then return 'Sabado';
        when 6 then return 'Domingo';
        else return '<Numero invalido>';
	end case;
end $$
create function mes(inNumero int) returns text
deterministic
begin
	Case inNumero
		when 1 then return 'Enero';
        when 2 then return 'Febrero';
        when 3 then return 'Marzo';
        when 4 then return 'Abril';
        when 5 then return 'Mayo';
        when 6 then return 'Junio';
        when 7 then return 'Julio';
        when 8 then return 'Agosto';
        when 9 then return 'Septiembre';
        when 10 then return 'Octubre';
        when 11 then return 'Noviembre';
        when 12 then return 'Diciembre';
        else return '<Numero invalido>';
	end case;
end $$
create function fecha_hora() returns text
deterministic
begin 
	return concat('Hoy es ',dia(date_format(curdate(),'%w')),', ',date_format(curdate(),'%w'),' de ',mes(date_format(curdate(),'%c')),'. Hora:  ', curtime());
end $$
delimiter ;
select fecha_hora();