
### Highlights

* 
- Kubernetes deployment for Kafka broker with 3 nodes using open-source components
- Apache Kakfa (RAFT)
- ksqlDB (https://ksqldb.io)
- Schema Registry (Confluent Community)
- Apahce Kafka Connect
- Kafdrop UI (https://github.com/obsidiandynamics/kafdrop)
* 


### Start Kafka, Kafdrop, kafka-connect, schema-registry
```
kubectl create namespace kafka
kubectl apply -f ./ -n kafka
kubectl apply -f schema-registry/. -n kafka
kubectl apply -f ksql/. -n kafka
kubectl apply -f ui/. -n kafka
```

### Kafdrop URL : http://localhost:9001/

### Kafka Connect URL: http://localhost:8082/

### Kafka Connect for Postgres
```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" --data @conf/cdc_postgres.json http://localhost:8082/connectors/

```

### Kafka Connect Sink for Elatic
```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @conf/elastic_sink.json http://localhost:8082/connectors/
```

#### Delete Connector
```
curl -X DELETE http://localhost:8082/connectors/cdc-local

```

### Broker URL in Kubernetes
```
kafka1.kafka.svc.cluster.local:9091,kafka2.kafka.svc.cluster.local:9092,kafka3.kafka.svc.cluster.local:9093

localhost:9091,localhost:9092,localhost:9093
```