use `bd-cole2026`;
drop function if exists validar_DNI;
delimiter $$
create function validar_DNI(inDNI char(10)) returns boolean
deterministic
begin
	declare dLetras text default 'TRWAGMYFPDXBNJZSQVHLCKE';
    declare dResto int default 0;
    declare dNumsDNI int default left(inDNI, length(inDNI)-1);
    set dResto = dNumsDNI %23;
    
    if substring(dLetras, (dResto+1), 1) = right(inDNI,1)
    then return false;
    else return true;
    end if;
end $$
drop procedure if exists new_Profe $$
create procedure new_Profe(inDNI char(10), inNombre varchar(50), inApellido varchar(50))
begin
	declare dCodProfe int default 0;
    declare dSueldo decimal(8,2) default 0.0;
    declare dEmail varchar(50) default '@ieselrincon';
    declare dFechaIng date default curdate();
    
    select max(CodProfe) into dCodProfe from profesor;
    set dCodProfe = dCodProfe+1;
    select avg(Sueldo) into dSueldo from profesor;
    set dEmail = concat(trim(ucase(left(inNombre,3))),trim(ucase(left(inApellido,3))),dEmail);
    
    if (select validar_DNI(inDNI)) then
		insert into profesor values (dCodProfe,inDNI,inNombre,inApellido,dSueldo,dEmail,dFechaIng,NULL);
        select concat('Profesor <',trim(inNombre),' ',trim(inApellido),'> añadido exitosamente');
	else
		select 'DNI no valido' as 'ERROR';
    end if;
    
end $$
delimiter ;

call new_Profe('223344556A','Carlos','Baute');