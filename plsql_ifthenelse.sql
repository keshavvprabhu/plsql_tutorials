/* if then else */
DECLARE

	v_number NUMBER := &enter_a_number;
	
BEGIN
	IF mod(v_number, 2) = 0 then 
		dbms_output.put_line(v_number || ' is even');
	ELSE
		dbms_output.put_line(v_number || ' is odd');
	END IF;
END;
/