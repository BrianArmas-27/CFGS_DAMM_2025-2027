use `bd-cole2026`;
set lc_time_names = 'es_ES';
drop function if exists CumpleMes;
delimiter $$
create function CumpleMes(inMes int) returns varchar(500)
deterministic
begin
	declare outResult varchar(500) default concat('Alumnos nacidos en <',monthname(concat('2000-',inMes,'-01')),'> ');

	declare dNombre varchar(50) default '';
	declare dDia int default 1;
    declare dMes int;
    declare dAno int default 1;
    declare dEnd boolean default false;
    
    declare cAlum cursor for
		select Nombre, day(Fechanac), year(fechanac)
        from alumnos where month(Fechanac) = dMes order by 2;
        
	declare continue handler for NOT FOUND set dEnd = true;
    if inMes<1 OR inMes>12 then
		set dMes = month(curdate());
	else
		set dMes = inMes;
	end if;
    open cAlum;
    
    set outResult = concat('Alumnos nacidos en <',monthname(concat('2000-',dMes,'-01')),'> ');
    
    fetch cAlum into dNombre, dDia, dAno;
    
    if dEnd then
		set outResult = concat(outResult, 'No hay datos de alumnos nacidos en ',monthname(concat('2000-',dMes,'-01')));
	end if;
    while !dEnd do
		set outResult = concat(outResult, '< ',trim(dNombre),', ',dayName(concat('2000-','-1-',trim(dDia))),', ',trim(dAno),' >');
        fetch cAlum into dNombre, dDia, dAno;
    end while;
    return outResult;
end $$
delimiter ;
select CumpleMes(4);