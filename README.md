### Kubernetes Deployments

#### Kubernetes Dashboard
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml
kubectl proxy
```
##### URL: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

###### Get Token
```
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^deployment-controller-token-/{print $1}') | awk '$1=="token:"{print $2}'
```

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '/^bootstrap-token-abcdef/{print $1}') | awk '$1=="token:"{print $2}'

###### Create Role and Get Token
```
kubectl apply -f kubernetes-dashboard/dashboard-admin.yaml
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
```


#### Install NGINX
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.40.0/deploy/static/provider/cloud/deploy.yaml

```

#### Using GCP via Docker

#### Create Kube Cluster
```
docker run -ti -d -e CLOUDSDK_CONFIG=/config/mygcloud -v `pwd`/mygcloud:/config/mygcloud -v `pwd`:/certs -v /Users/hardikpatel/workbench/projects/kube-deploys:/kube-deploys --name=gcloud google/cloud-sdk /bin/bash 
docker run -ti -d -e CLOUDSDK_CONFIG=/config/mygcloud -v /Users/hardikpatel/workbench/projects/kube-deploys:/kube-deploys --name=gcloud google/cloud-sdk /bin/bash 
docker attach gcloud
gcloud auth login
gcloud config set project kube-cits
apt-get install kubectl
gcloud config set compute/zone us-east4-a
gcloud container clusters create cluster-cits --num-nodes=3
gcloud container clusters get-credentials cluster-cits
```

##### Reset Kubernetes Cluster
```
rm -rf ~/Library/Group\ Containers/group.com.docker/pki/
rm -rf ~/.kube

```