use `bd-cole2026`;
drop procedure if exists get_modulo;
delimiter $$
create procedure get_modulo(inSiglas char(3))
begin
	declare dCodMod char(2);
    select codMod into dCodMod from modulos
    where siglas = inSiglas;
    
	if inSiglas in (select siglas from modulos) then
		if dCodMod in(select codmod from notas) then
			select m.Siglas, m.Titulo, avg(n.nota) as 'Nota media', 
            count(if(n.nota <5,1,null)) as Suspensos, count(if(n.nota>=5,1,null)) as Aprobados, 
            concat(trim(p.nombre),' ',trim(apellido)) as Profesor
			from modulos as m left join notas as n on m.codmod = n.codmod join profesor as p on m.profe = p.codprofe
			where m.Siglas = inSiglas and m.codmod in (select codmod from modulos where siglas = inSiglas)
			group by m.codmod;
		else
			select concat('No hay alumnos registrados en <',inSiglas,'>') as 'Error 2';
        end if;
	else
		Select concat('No hay datos de <',inSiglas,'>') as 'Error 1';
	end if;
end $$
delimiter ;
call get_modulo('PRO');
call get_modulo('ASS');
call get_modulo('SGF')