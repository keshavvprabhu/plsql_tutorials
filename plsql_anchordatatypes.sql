SET SERVEROUTPUT ON;
DECLARE
	v_salary employee.emp_id%TYPE;
	-- anchor datatype syntax:
	-- 	variable-name typed-attribute%type
	
BEGIN
	select salary into v_salary from employee where emp_id=100;
	dbms_output.put_line(v_salary);
END;
/
DECLARE
	v_salary employee.salary%TYPE;
	v_fname employee.first_name%TYPE;
	
BEGIN
	select salary, first_name into v_salary, v_fname from employee where emp_id=100;
	dbms_output.put_line(v_fname || ' has salary '|| v_salary);
END;
/
