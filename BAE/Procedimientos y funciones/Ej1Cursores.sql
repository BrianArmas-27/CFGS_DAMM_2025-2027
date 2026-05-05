use almacensl;
drop function if exists listadoColor;
delimiter $$
create function listadoColor(inColor varchar(20)) returns varchar(500)
deterministic
begin
declare vPnum char(5) default '';
declare vPnombre varchar(20) default '';
declare vPrecio decimal(8,2) default 0.0;
declare vEnd boolean default false;
declare outResult varchar(500) default concat('Articulos de color <',inColor,'> : ');

declare CursorColor cursor for 
	select Pnum, Pnombre, Precio
    from producto where Color = inColor;
    
declare continue handler for NOT FOUND set vEnd = true;

open CursorColor;
fetch CursorColor into vPnum, vPnombre, vPrecio;

if vEnd then
	set outResult = concat(outResult, "No existen productos de este color");
end if;
while !vEnd do
if vPrecio is null then set vPrecio = 0.0; end if;
set outResult = concat(outResult,'-', vPnum,'-',  vPnombre,'-', vPrecio,'€');
fetch CursorColor into vPnum, vPnombre, vPrecio;
end while;
end $$