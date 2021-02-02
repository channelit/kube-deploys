

### Highlights

* 
- Kubernetes deployment
- Using Apache Kakfa downloaded from open source project
- Separate namespaces for Kafka and Zookeeper
- 3 node Zookeeper and 3 node Kafak
* 

```
kubectl create namespace kafka
kubectl apply -f ./ -n kafka
```
#### CMAK url for ZK
```
zoo1.zookeeper.svc.cluster.local:2181,zoo2.zookeeper.svc.cluster.local:2181,zoo3.zookeeper.svc.cluster.local:2181/kafka
```