SET SERVEROUTPUT ON

DECLARE
 v_number NUMBER := 19;
 v_result NUMBER;
BEGIN
	FOR v_counter IN 1 .. 10 LOOP
		v_result = v_number * i ;
		dbms_output.put_line(v_number ||'  * '|| v_counter ||' = ' || v_result );
	END LOOP;
	/* Reverse Order */
	FOR v_counter IN REVERSE 1 .. 10 LOOP
		v_result = v_number * i ;
		dbms_output.put_line(v_number ||'  * '|| v_counter ||' = ' || v_result );
	END LOOP;
END;
/