# Solr Kubernetes deployment examples

### Start Zookeeper cluster (from ../zookeeper)
```
kubectl create namespace zookeeper
kubectl apply -f ./ -n zookeeper
```

### Start Solr Cluster
```
kubectl create namespace solr
kubectl apply -f solr1.yml -n solr
kubectl apply -f ./ -n solr
```