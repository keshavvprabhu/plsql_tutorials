/* DML Auditing triggers */
CREATE TABLE sh_audit (
	new_name varchar2(30),
	old_name varchar2(30),
	user_name varchar2(30),
	entry_date varchar2(30),
	operation varchar2(30)
);


CREATE OR REPLACE trigger superheroes_audit 
BEFORE INSERT OR UPDATE OR DELETE ON superheroes 
for each ROW
ENABLE 
DECLARE
	v_user varchar2(30);
	v_date varchar2(30);
begin
	select user, to_char(sysdate, 'DD/MON/YYYY HH24:MI:SS') into v_user, v_date from dual;
	if inserting then 
		insert into superheroes_audit(new_name, old_name, user_name, entry_date, operation)
		values (:NEW.superhero_name, NULL, v_user, v_date, 'Insert');
	elsif deleting then 
		insert into superheroes_audit(new_name, old_name, user_name, entry_date, operation)
		values (NULL, :OLD.superhero_name, v_user, v_date, 'Delete');
	elsif updating then 
		insert into superheroes_audit(new_name, old_name, user_name, entry_date, operation)
		values (:NEW.superhero_name, :OLD.superhero_name, v_user, v_date, 'Update');
	end if;
end;
/