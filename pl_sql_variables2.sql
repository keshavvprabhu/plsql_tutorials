SET SERVEROUTPUT ON;
DECLARE
	v_salary NUMBER(8);
BEGIN
	select salary into v_salary from employees where emp_id=100;
	dbms_output.put_line(v_salary);
END;
/
DECLARE
	v_salary number(8);
	v_fname varchar2(20);
	
BEGIN
	select salary, first_name into v_salary, v_fname from employee where emp_id=100;
	dbms_output.put_line(v_fname || ' has salary '|| v_salary);
END;
/
