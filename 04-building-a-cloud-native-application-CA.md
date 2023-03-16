# Building a Cloud Native Application in EKS
Cloud Academy Lab: [Deploying a Cloud Native Application](https://cloudacademy.com/lab/eks-voteapp/deploying-voteapp/)

## Getting started
[Start here with the toolchain](01-getting-started.md)

## Creating the EKS Cluster

```bash
# variable used in the lab
EKS_CLUSTER_NAME=dev

# creating a basic cluster with 2 worker nodes
eksctl create cluster \
--name $EKS_CLUSTER_NAME \
--region=us-east-1 \
--nodegroup-name dev-nodes \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--managed

```

```bash
# Check the cluster
eksctl get cluster
aws eks list-clusters

# Get nodes
kubectl get nodes
kubectl describe nodes
```

## Installing Additionall Addons
By default: coredns and kube-proxy was installed

EBS CSI controller
```bash
# Create IAM Open ID Connect provider for cluster
eksctl utils associate-iam-oidc-provider --cluster $EKS_CLUSTER_NAME --approve
# Check from IAM>Access Management>Identity Providers

# Create a role AmazonEKS_EBS_CSI_DriverRole and attached a managed IAM policy AmazonEBSCSIDriverPolicy
eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster $EKS_CLUSTER_NAME \
  --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole

# Check the new resource from IAM and CloudFormation

# Installing Amazon EBS CSI Driver
eksctl create addon --name aws-ebs-csi-driver --cluster $EKS_CLUSTER_NAME --service-account-role-arn "arn:aws:iam::$(aws sts get-caller-identity --query Account | jq -r):role/AmazonEKS_EBS_CSI_DriverRole" --force

# Check
kubectl get pods -n kube-system
```

## Preparing
```bash
# Creating the Namespace cloudnativeapp
kubectl apply -f CA-vote-app/01-preparing/01-namespace.yaml

# Set default namespace in the CLI
kubectl config set-context --current --namespace cloudnativeapp

# Check the Storage Class
kubectl get storageclass

```

# Deploying the application
Source code:
- https://github.com/cloudacademy/voteapp-frontend-react-2020
- https://github.com/cloudacademy/voteapp-api-go

## Deploying the MongoDB database
```bash

# Create the StatefulSet for the mongodb cluster
kubectl apply -f CA-vote-app/02-db/01-mongodb-cluster.yaml

# check volume
kubectl get pvc
# you can check in AWS Console EC2>Elastic Block Store>Volumes

# Check pods status
kubectl get pods --watch
kubectl get pods -l role=db

# Check the StatefulSet status
kubectl get statefulset
kubectl describe statefulset mongo

# Check multiple resources with the same command
kubectl get pod,pv,pvc

```

```bash
# Create a new Headless Service for Mongo (ClusterIP)
kubectl apply -f CA-vote-app/02-db/02-mongodb-svc.yaml

# check the resource created
kubectl get svc

# Validate the DNS records produced by the mongo Headless Service
kubectl run --rm utils -it --image praqma/network-multitool -- bash
for i in {0..2}; do nslookup mongo-$i.mongo; done
exit

# Confirm that the mongo shell can now also resolve each of the 3 Mongo headless Service assigned DNS names
for i in {0..2}; do kubectl exec -it mongo-0 -- mongo mongo-$i.mongo --eval "print('mongo-$i.mongo SUCCEEDED\n')"; done

```

```bash
# On the mongo-0 pod, initialise the Mongo database Replica set
cat << EOF | kubectl exec -it mongo-0 -- mongo
rs.initiate();
sleep(2000);
rs.add("mongo-1.mongo:27017");
sleep(2000);
rs.add("mongo-2.mongo:27017");
sleep(2000);
cfg = rs.conf();
cfg.members[0].host = "mongo-0.mongo:27017";
rs.reconfig(cfg, {force: true});
sleep(5000);
EOF

# Confirm that the MongoDB database replica set has been correctly established.
kubectl exec -it mongo-0 -- mongo --eval "rs.status()" | grep "PRIMARY\|SECONDARY"

```

```bash
# Load the initial voting app data into the MongoDB database
cat << EOF | kubectl exec -it mongo-0 -- mongo
use langdb;
db.languages.insert({"name" : "csharp", "codedetail" : { "usecase" : "system, web, server-side", "rank" : 5, "compiled" : false, "homepage" : "https://dotnet.microsoft.com/learn/csharp", "download" : "https://dotnet.microsoft.com/download/", "votes" : 0}});
db.languages.insert({"name" : "python", "codedetail" : { "usecase" : "system, web, server-side", "rank" : 3, "script" : false, "homepage" : "https://www.python.org/", "download" : "https://www.python.org/downloads/", "votes" : 0}});
db.languages.insert({"name" : "javascript", "codedetail" : { "usecase" : "web, client-side", "rank" : 7, "script" : false, "homepage" : "https://en.wikipedia.org/wiki/JavaScript", "download" : "n/a", "votes" : 0}});
db.languages.insert({"name" : "go", "codedetail" : { "usecase" : "system, web, server-side", "rank" : 12, "compiled" : true, "homepage" : "https://golang.org", "download" : "https://golang.org/dl/", "votes" : 0}});
db.languages.insert({"name" : "java", "codedetail" : { "usecase" : "system, web, server-side", "rank" : 1, "compiled" : true, "homepage" : "https://www.java.com/en/", "download" : "https://www.java.com/en/download/", "votes" : 0}});
db.languages.insert({"name" : "nodejs", "codedetail" : { "usecase" : "system, web, server-side", "rank" : 20, "script" : false, "homepage" : "https://nodejs.org/en/", "download" : "https://nodejs.org/en/download/", "votes" : 0}});

db.languages.find().pretty();
EOF

# Confirm the voting app data has been loaded correctly
kubectl exec -it mongo-0 -- mongo langdb --eval "db.languages.find().pretty()"

```

```bash
# Create a secret to store the MongoDB connection credentials for the API
echo -n 'admin' | base64
echo -n 'password' | base64

kubectl apply -f CA-vote-app/02-db/03-mongodb-secret.yaml

# check
kubectl get secret
```

## Deploying the API
```bash
# Create the API Deployment resource
kubectl apply -f CA-vote-app/03-api/01-api-deployment.yaml

# Check the resources
kubectl get deploy api -o wide
kubectl rollout status deployment api
kubectl get pods -l role=api

# Create a new Service resource of LoadBalancer type
kubectl expose deploy api \
 --name=api \
 --type=LoadBalancer \
 --port=80 \
 --target-port=8080

# Check the creation process from EC2>Load balancers
kubectl get svc api

```

```bash
# Test and confirm that the API route URL /ok endpoint can be called successfully
curl http://a9ff9d3e09c6e40f49e2654506036872-1576380877.us-east-1.elb.amazonaws.com/ok

# Test and confirm that the API route URL /languages, and /languages/{name} endpoints can be called successfully.
API_ELB_PUBLIC_FQDN=a9ff9d3e09c6e40f49e2654506036872-1576380877.us-east-1.elb.amazonaws.com 
curl -s $API_ELB_PUBLIC_FQDN/languages | jq .
curl -s $API_ELB_PUBLIC_FQDN/languages/go | jq .
curl -s $API_ELB_PUBLIC_FQDN/languages/java | jq .
curl -s $API_ELB_PUBLIC_FQDN/languages/nodejs | jq .

```

## Deploying the Frontend
```bash
# Retrieve the FQDN of the API LoadBalancer and store it in the $API_PUBLIC_FQDN variable.
{
export API_ELB_PUBLIC_FQDN=$(kubectl get svc api -ojsonpath="{.status.loadBalancer.ingress[0].hostname}")
echo API_ELB_PUBLIC_FQDN=$API_ELB_PUBLIC_FQDN
}

# Create the Frontend Deployment resource
# note uses the API_ELB_PUBLIC_FQDN variable created above
kubectl apply -f CA-vote-app/04-frontend/01-frontend-deployment.yaml

# Check the resources
kubectl get deploy frontend -o wide
kubectl rollout status deployment frontend
kubectl get pods -l role=frontend

# Create a new Service resource of LoadBalancer type
kubectl expose deploy frontend \
 --name=frontend \
 --type=LoadBalancer \
 --port=80 \
 --target-port=8080

# Check the creation process from EC2>Load balancers
kubectl get svc frontend

```
# Check Logs
```bash
kubectl logs -l role=api --all-containers=true -f
kubectl logs -l role=frontend --all-containers=true -f
```

# Troubleshoot
```bash
kubectl rollout restart deploy frontend
```