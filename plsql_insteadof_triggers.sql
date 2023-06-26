-- https://www.youtube.com/watch?v=GOqIOiX_8NY&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=22
-- Using Instead Of triggers you can control the default behavior of Insert, Update, Delete and Merge Operations on "Views" but not on tables

-- We can use them to make a non-updatable view updatable

-- CREATE OR REPLACE TRIGGER trigger_name
-- INSTEAD OF opreration 
-- on view_name
-- for each row
-- BEGIN

-- END;
/* example */

CREATE TABLE TRAINER (
    full_name varchar2(20)
);

create table subject (
    subject_name varchar2(20)
);


insert into trainer values ('Keshav Prabhu');
insert into subject values ('Chemistry');


create view vw_FinalView as 
select full_name, subject_name from trainer, subject;

insert into vw_FinalView values ('Sachin Tendulkar', 'English');
commit;
CREATE OR REPLACE TRIGGER tr_io_insert 
INSTEAD OF INSERT ON vw_FinalView
FOR EACH ROW 
BEGIN 
    INSERT into TRAINER (full_name) VALUES (:new.full_name);
    insert into subject (subject_name) values (:old.subject_name);
    commit;
END;
/

CREATE OR REPLACE TRIGGER tr_io_update 
INSTEAD OF UPDATE ON vw_FinalView
FOR EACH ROW 
BEGIN
    UPDATE vw_FinalView SET full_name = :new.full_name
    where full_name = :old.full_name;
    update vw_FinalView set subject_name= :new.subject_name
    where subject_name = :OLD.subject_name;
    commit;
END;
/