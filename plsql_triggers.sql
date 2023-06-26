/* https://www.youtube.com/watch?v=R3fvX_xf5P4&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=14 */
-- Triggers -- 
-- Triggers execute when an event occurs such as a DML statement, DDL Statement or a System Event
-- 5 types of TRIGGERS
-- (1) DML triggers 
-- (2) DDL triggers 
-- (3) System or Database triggers 
-- (4) Instead-of triggers
-- (5) Compound Triggers 

/* BENEFITS OF USING TRIGGERS */
-- Enforce Business Rules
-- Gain Strong Control over the security
-- Collect Statistical Information
-- Automatically Generate Values
-- Prevent Invalid Transactions

/* 
	create [or replace] trigger trigger_name
	{before| after} triggering_event on table_name
	[for each row] [follows another trigger_name]
	[enable|disable] [when condition]
	DECLARE
		declaration statements
	BEGIN
		execution statements
	END;
*/

create table superheroes (
	superhero_name varchar2(50);
);/

SET SERVEROUTPUT ON;

create or replace trigger bi_superheroes
before insert on superheroes
for each ROW
ENABLE 
DECLARE
	v_user varchar2(50);
BEGIN
	select user into v_user from dual;
	dbms_output.put_line('You just inserted a record into superheroes table' || v_user);
END;
/

insert into superheroes values ('Spiderman');
/
insert into superheroes values ('Ironman');
/
create or replace trigger bu_superheroes
before update on superheroes
for each ROW
ENABLE 
DECLARE
	v_user varchar2(50);
BEGIN
	select user into v_user from dual;
	dbms_output.put_line('You just updated a record into superheroes table' || v_user);
END;

update superheroes set superhero_name = 'Tony Stark' where superhero_name = 'Ironman';
/
commit;
/

CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR UPDATE OR DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE 
	v_user  varchar2(50);
BEGIN
	SELECT user into v_user from dual;
	if inserting then 
		dbms_output.put_line('One Row Inserted by '|| v_user);
	elsif deleting THEN
		dbms_output.put_line('One Row deleted by '|| v_user);
	elsif updating then 
		dbms_output.put_line('One Row deleted by '|| v_user);
	ELSE
		dbms_output.put_line('Some other operation');
END;