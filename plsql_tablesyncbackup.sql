/* Make Synchronized Backup of a table */
/* https://www.youtube.com/watch?v=jSv1LIlNKU0&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=17*/
DESC superheroes;
/
create table superheroes_backup as select * from superheroes where 1=2;
/

CREATE OR REPLACE TRIGGER sh_backup
BEFORE INSERT OR UPDATE OR DELETE ON superheroes
FOR EACH ROW 
ENABLE 
BEGIN
	if inserting then 
		insert into superheroes_backup (superhero_name) values (:NEW.superhero_name);
	elsif deleting THEN
		delete from superheroes_backup where superhero_name = :old.superhero_name;
	elsif updating then 
		update superheroes_backup set superhero_name = :NEW.superhero_name where superhero_name = :OLD.superhero_name;
	
	END IF;
END;
/