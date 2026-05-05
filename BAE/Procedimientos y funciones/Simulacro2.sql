drop function if exists InformeEmpleado;
delimiter $$
create function InformeEmpleado(inNemp int) returns text
deterministic
begin
	declare dNombEmp varchar(50) default '';
    declare dSueldo decimal(8,2) default 0.0;
    declare dPuesto varchar(20) default '';
    declare dEmail varchar(60) default '------';
    declare dJefe varchar(20) default '------';
    
    if inNemp in (select nemp from empleado) then
		select concat(trim(e1.Nombre),' ',trim(e1.apellido)) as 'Empleado', e1.salario as 'Sueldo', e1.empleo as 'Puesto', e1.email, e2.nombre as 'Jefe'
        into dNombEmp, dSueldo, dPuesto, dEmail, dJefe
		from empleado as e1 join empleado as e2 on e1.supervs=e2.nemp
		where e1.nemp=inNemp;
        if dEmail is null then set dEmail =  '------'; end if;
        if dJefe is null then set dJefe = '------'; end if;
	else
		return concat('No hay datos de empleado <',inNemp,'>');
     end if;
	return concat('Nombre: ',dNombEmp,' - Sueldo: ',dSueldo,' - Puesto: ',dPuesto,' - Email:',dEmail,' - Jefe: ',dJefe);
end $$
delimiter ;
select InformeEmpleado(7329);