-- Constants in PL/SQL
SET SERVEROUTPUT ON;

DECLARE
	 -- Constant-name CONSTANT DATATYPE(DW) := value;
	 -- Constant needs to be initialized in the declaration block and cannot be initiatlized anywere ELSE
	 v_pi CONSTANT NUMBER(7,6) := 3.141592;
 
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_pi);
END;
/
DECLARE
	 -- Constant-name CONSTANT DATATYPE(DW) := value;
	 -- DEFAULT keyword can be used instead of assignment operator. What is the benefit?
	 
	 v_pi CONSTANT NUMBER(7,6) NOT NULL DEFAULT 3.141592;
 
BEGIN
	DBMS_OUTPUT.PUT_LINE(v_pi);
END;