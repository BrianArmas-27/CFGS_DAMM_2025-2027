use almacensl;
drop function if exists Listadovendedores;
delimiter $$
create function ListadoVendedores(inCiudad varchar(50)) returns varchar(500)
deterministic
begin
	declare outResult varchar(500) default concat('Vendedores de <',inCiudad,'>');
    declare dNombre varchar(50) default '';
    declare dTlf int default 0;
    declare dEnd boolean default false;
    
    declare cSum cursor for
		select Snombre, Movil from Suministrador
        where Ciudad = inCiudad;
        
	declare continue handler for NOT FOUND SET dEnd = true;
    
    open cSum;
    
    if dEnd then
		set outResult = concat(outResult,' No hay suministradores en esta ciudad');
	end if;
	while !dEnd do
		set outResult = concat (outResult,'-',dNombre,'-',dTlf);
    fetch cSum into dNombre, dTlf;
    end while;
    return outResult;
end $$
delimiter ;
select ListadoVendedores('Paris')