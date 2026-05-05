drop function if exists califica;
delimiter $$
create function califica(inNota int) returns text
deterministic
begin 
	case inNota
		when 0 then return 'MDEF';
		when 1 then return 'MDEF';
        when 2 then return 'MDEF';
        when 3 then return 'INS';
		when 4 then return 'INS';
        when 5 then return 'SUF';
        when 6 then return 'BIEN';
		when 7 then return 'NOT';
        when 8 then return 'NOT';
        when 9 then return 'SOB';
        when 10 then return 'SOB';
        else return 'Valor fuera de rango';
    end case;
end $$
delimiter $$
Select califica(9);