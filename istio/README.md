#### Install Istio in container and in Kube
```
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.2.5 sh -
istioctl install
kubectl create namespace keycloak
```