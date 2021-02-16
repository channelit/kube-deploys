#### Install Istio in container and in Kube
```
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.9.0
export PATH=$PWD/bin:$PATH
$ istioctl install --set profile=demo -y
```