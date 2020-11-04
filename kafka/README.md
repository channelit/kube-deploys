```
kubectl create namespace kafka
kubectl apply -f ./ -n kafka
```
#### CMAK url for ZK
```
zoo1.zookeeper.svc.cluster.local:2181 zoo2.zookeeper.svc.cluster.local:2181 zoo3.zookeeper.svc.cluster.local:2181/kafka
```