### Postgres
```
CREATE TABLE public.EMPLOYEE (
   ID VARCHAR PRIMARY KEY     NOT NULL,
   NAME           VARCHAR    NOT NULL,
   SALARY         INTEGER
);

CREATE TABLE public.TIMESHEET (
   ID       VARCHAR PRIMARY KEY NOT NULL,
   EMPLOYEE_ID VARCHAR NOT NULL,
   CODE     VARCHAR NOT NULL,
   DATE     DATE,
   HOURS    INTEGER
);

DROP TABLE public.EMPLOYEE;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
insert into public.employee values (uuid_generate_v1(),'demo2',100);
insert into public.timesheet values (uuid_generate_v1(),'id,100, current_timestamp, 8);
```
### Streams
#### EMPLOYEE Stream
```
CREATE STREAM employee WITH (kafka_topic='cdc.public.employee', format='JSON_SR');
```
#### TIMESHEET Stream
```
CREATE STREAM timesheet WITH (kafka_topic='cdc.public.timesheet', format='JSON_SR');
```
#### Parsed Streams
```
CREATE OR REPLACE STREAM _employee AS 
	SELECT
 		ROWKEY AS ID,
 		AFTER->id AS EMPLOYEE_ID,
        AFTER->name as NAME,
        AFTER->salary as SALARY
	FROM employee
EMIT CHANGES;

CREATE OR REPLACE STREAM _timesheet AS 
    SELECT 
    	ROWKEY AS ID,
		AFTER->employee_id as EMPLOYEE_ID,
		AFTER->code as CODE,
		AFTER->date as DATE
		FROM timesheet
EMIT CHANGES;
```
### Stream JOIN
```
    SELECT
        E.ID,
        E.NAME,
        E.SALARY,
        T.DATE
    FROM _TIMESHEET T INNER JOIN _EMPLOYEE E
    WITHIN 300000 SECONDS
    	ON T.EMPLOYEE_ID = E.EMPLOYEE_ID
EMIT CHANGES;
```