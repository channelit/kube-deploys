### Kubernetes Deployments

#### Kubernetes Dashboard
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl proxy
```
##### URL: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

###### Get Token
```
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1=="token:"{print $2}'
```

#### Install NGINX
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.40.0/deploy/static/provider/cloud/deploy.yaml

```

#### Using GCP via Docker
```
docker run -ti -d -e CLOUDSDK_CONFIG=/config/mygcloud -v `pwd`/mycloud:/config/mycloud -v `pwd`:/certs --name=gcloud google/cloud-sdk /bin/bash 
docker attach gcloud
gcloud auth login
gcloud config set project kube-cits
apt-get install kubectl
```