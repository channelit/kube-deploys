### Enable WAL2JSON on Postgres
```
show wal_level;
show max_replication_slots;
CREATE TABLE public.EMPLOYEE (
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   SALARY         REAL
);

insert into public.employee values (1,'h',100);

```