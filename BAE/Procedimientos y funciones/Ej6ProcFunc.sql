use `bd-cole2026`;
drop procedure if exists get_boletin2;
delimiter $$
create procedure get_boletin(inDNI char(10))
begin
	if inDNI in (select DNI from alumnos) then
		select m.Siglas, m.Titulo, nota, califica(nota)
		from notas as n join modulos as m on m.codmod = n.codmod
		where codalum in (select codalum from alumnos where DNI = inDNI);
	else
		select 'DNI no válido o inexistente';
	end if;
end $$
delimiter ;
call get_boletin2('11223344A');