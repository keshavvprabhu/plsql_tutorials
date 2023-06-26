/* PL SQL program to illustrate a Simple Loop*/
SET SERVEROUTPUT ON;
DECLARE
	v_counter NUMBER := 0;
	v_number NUMBER := &enter_number;
	v_result NUMBER;

BEGIN
	LOOP
		v_counter := v_counter + 1;
		v_result = v_number * v_counter;
		dbms_output.put_line(v_number || ' * ' || v_counter || ' = ' || v_result);
		if v_counter >= 10 then 
			EXIT;
		end if;
		 -- or  --
		-- exit when v_counter >= 10;
	END LOOP;
END;
/
