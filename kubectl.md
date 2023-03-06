# kubectl

kubectl cluster-info

## Config
```bash
kubectl get-contexts
kubectl config current-context

kubectl config use-context contextname
```

## Namespaces
```bash
kubectl get ns
```
## Nodes
```bash
kubectl get node -o wide
kubectl get node nodeName
```

## Services
```bash
kubectl get svc
kubectl get svc -o wide
kubectl apply -f ./nginx-svc.yaml
kubectl get pod
```

## ReplicaSet
```bash
kubectl get rs
```

## Deployments
```bash
kubectl get deployment
kubectl get deployment -o wide
kubectl apply -f ./nginx-deployment.yaml
```

## Pods
```bash
kubectl get pods
kubectl get pods -o wide
kubectl get pods --all-namespaces -o wide
kubectl get pods podName
kubectl get pods podName -o yaml
kubectl apply -f ./nginx-deployment.yaml
```
