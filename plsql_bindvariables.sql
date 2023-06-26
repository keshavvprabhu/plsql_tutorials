SET SERVEROUTPUT ON;
-- SET AUTOPRINT ON;  -- automatically prints the bind variables
-- bind variable
variable v_bind varchar2(10);
EXEC :v_bind := 'Oracle';

BEGIN
	:v_bind := 'Oracle SQL';
	-- print bind variable value - method 1
	dbms_output.put_line(:v_bind);
END;
/
-- print bind variable - method 2
print :v_bind;


