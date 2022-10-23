### Get shell in Postgres Pod
```
kubectl get pods -n postgres
kubectl exec --stdin --tty <pod_name_from_above_command> -- /bin/bash
```

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