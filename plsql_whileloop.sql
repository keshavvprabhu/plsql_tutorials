SET SERVEROUTPUT ON;
DECLARE
	v_number NUMBER:= &enter_number;
	v_result NUMBER;
	v_counter NUMBER := 1;
BEGIN
	WHILE v_counter <= 10 LOOP
		v_result := v_number * v_counter;
		dbms_output.put_line(v_number ||' * ' ||v_counter ||' = ' ||v_result);
		v_counter := v_counter + 1;
	END LOOP;
END;
/