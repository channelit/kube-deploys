
### Highlights

* 
- Kubernetes deployment
- Using Apache Kakfa downloaded from open source project
- Separate namespaces for Kafka and Zookeeper
- 3 node Zookeeper and 3 node Kafak
* 

### Start Zookeeper cluster (from ../zookeeper)
```
kubectl create namespace zookeeper
kubectl apply -f ./ -n zookeeper
```

### Start Kafka, Kafdrop, kafka-connect
```
kubectl create namespace kafka
kubectl apply -f ./ -n kafka
```
#### CMAK url for ZK
```
zoo1.zookeeper.svc.cluster.local:2181,zoo2.zookeeper.svc.cluster.local:2181,zoo3.zookeeper.svc.cluster.local:2181/kafka
```

### Kafdrop URL : 

### Kafka Connect URL: http://localhost:8082/

### Kafka Connect for Postgres
```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" --data @conf/cdc_postgres.json http://localhost:8082/connectors/

```

### Kafka Connect Sink for Elatic
```
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" -d @conf/elastic_sink.json http://34.139.102.126:8082/connectors/
```

#### Delete Connector
```
curl -X DELETE http://localhost:8082/connectors/cdc-local

```

### Broker URL in Kubernetes
```
kafka1.kafka.svc.cluster.local:39091,kafka2.kafka.svc.cluster.local:39092,kafka3.kafka.svc.cluster.local:39093

localhost:39091,localhost:39092,localhost:39093
```