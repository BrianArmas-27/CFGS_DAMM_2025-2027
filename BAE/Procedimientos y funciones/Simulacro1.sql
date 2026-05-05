use simulacro;
drop procedure if exists ListadoDepartamento;
delimiter $$
create procedure ListadoDepartamento(inNombDep varchar(20))
begin
	declare dNdep int;
    
	if inNombDep in (select Nombdep from departamento) then
		select Ndep into dNdep from departamento
        where NombDep = inNombDep;
        if dNdep in (select Ndep from empleado) then
			select Nombre as 'Nombre del empleado', FechaIng as 'FechaIng', year(curdate())-year(FechaIng) as 'Años de antigüedad', Empleo as 'Puesto de trabajo'
			from empleado
			where Ndep = dNdep;
		else
			select concat('No hay empleados registrados en <',inNombDep,'>') as 'Error 2';
		end if;
    else
		select concat('No existe el departamento <',inNombDep,'>') as 'Error 1';
    end if;
end $$
delimiter ;
call ListadoDepartamento('operaciones');