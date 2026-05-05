drop trigger if exists FechaIncorrecta;
delimiter $$
create trigger FechaIncorrecta before insert on empleado for each row
begin
	if new.fechaing > curdate() then
		set new.fechaing = curdate();
	end if;
end$$
delimiter ;
-- insert into empleado values (1111, 'FELIPE', 'GIL', 'VENDEDOR', '2028-09-16', null, 1000, 30, null, null);
select * from empleado
where nemp = 1111