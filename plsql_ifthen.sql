/* if then */
/* if condition THEN
	STATEMENT 1;
	...
	STATEMENT n;
end if; */


set serveroutput ON;
DECLARE
	v_num NUMBER :=9;

BEGIN
	if v_num <10 THEN
		dbms_output.put_line('Inside If');
	end if;
		
END;
/
DECLARE
	v_website varchar2(50) := 'www.oracle.com'
	v_author varchar2(50) := 'Keshav Prabhu'

BEGIN
	if v_website = 'www.google.com' and v_author = 'Keshav Prabhu' then 
		dbms_output.put_line('Everything is awesome!');
	end if;
	
	dbms_output.put_line('The End');
	
END;
/