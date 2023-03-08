# kubectl

kubectl cluster-info

## Config
```bash
kubectl config get-contexts
kubectl config current-context

kubectl config use-context contextname
```

Retrieve your Amazon EKS cluster connection details, saving them into the ~/.kube/config file
```bash
aws eks update-kubeconfig --name clusterName --region us-east-1
```

## Namespaces
```bash
kubectl get ns
```
Configure a default namespace.
```bash
kubectl config set-context --current --namespace cloudacademy
```
## Nodes
```bash
kubectl get node -o wide
kubectl get node nodeName
kubectl describe nodes
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

# Run a watch on the pods in the current namespace.
kubectl get pods --watch

# View the pods with the db label in the current namespace.
kubectl get pods -l role=db 

#Display  Pods, Persistent Volumes and Persistent Volume Claims in the same command
kubectl get pod,pv,pvc
```

## EKS storage classes
```bash
kubectl get storageclass
```
