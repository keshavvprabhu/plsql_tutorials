/* DDL triggers */
-- Session 18 --
-- Use DDL triggers to keep track of changes to the database

SHOW user;
/
CREATE TABLE schema_audit(
	ddl_date date,
	ddl_user varchar2(30),
	object_created varchar2(50),
	object_name varchar2(50),
	ddl_operation varchar2(30)
);
/
CREATE OR REPLACE TRIGGER HR_AUDIT_TR
AFTER DDL ON SCHEMA
BEGIN
	INSERT INTO schema_audit values (
	sysdate, 
	sys_context('USERENV','CURRENT_USER'),
	ora_dict_obj_type,
	ora_dict_obj_name,
	ora_sysevent
	);
END;
/