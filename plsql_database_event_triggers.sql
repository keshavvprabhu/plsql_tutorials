/*PLSQL Database Event Triggers */
-- https://www.youtube.com/watch?v=dJSlgiwt7w0&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=19
-- database logon/logoff/startup/shutdown
-- Requires Admin Privileges

-- SYNTAX --
--CREATE OR REPLACE TRIGGER trigger_name
--BEFORE | AFTER database_event on database/schema
--BEGIN
--	PL/SQL CODE
--END;
/
CREATE  TABLE HR_EVENT_AUDIT (
	event_type varchar2(50),
	logon_date date,
	logon_time varchar2(15),
	logoff_date date,
	logoff_time varchar2(15)
);

CREATE OR REPLACE TRIGGER hr_logon_audit
AFTER LOGON ON SCHEMA
BEGIN
	INSERT INTO HR_EVENT_AUDIT VALUES(
		ORA_SYSEVENT,
		SYSDATE, 
		TO_CHAR(SYSDATE, 'HH24:MI:SS'),
		NULL,
		NULL
	);
	commit;
END;
/
disc;
conn hr/hr;

-- LOGOFF TRIGGER
/*https://www.youtube.com/watch?v=l5lcE68xK-k&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=20 */
CREATE OR REPLACE TRIGGER  hr_logoff_audit
BEFORE LOGOFF ON SCHEMA
BEGIN
	INSERT INTO HR_EVENT_AUDIT VALUES(
		ORA_SYSEVENT,
		NULL,
		NULL,
		SYSDATE,
		TO_CHAR(SYSDATE, 'HH24:MI:SS')
	);
	COMMIT;
END;
/
DISC;
CONN HR/HR;

/* https://www.youtube.com/watch?v=l5lcE68xK-k&list=PLL_LQvNX4xKyiExzq9GKwORoH6nvaRnOQ&index=20 */

CREATE TABLE DB_EVENT_AUDIT (
	user_name varchar2(15),
	event_type varchar2(30),
	logon_date date, 
	logon_time varchar2(15),
	logoff_date date, 
	logoff_time varchar2(15)
);

/
CREATE OR REPLACE TRIGGER db_logoff_audit
BEFORE LOGOFF ON DATABASE
BEGIN
	INSERT INTO DB_EVENT_AUDIT VALUES(
		USER, 
		ORA_SYSEVENT,
		NULL,
		NULL, 
		SYSDATE, 
		TO_CHAR(SYSDATE, 'HH24:MI:SS') 
	);
	COMMIT;
END;
/
DISC;

