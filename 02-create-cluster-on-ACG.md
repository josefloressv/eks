# Launching an EKS Cluster
[Hands-on lab](https://learn.acloud.guru/handson/f41da9b7-8408-4499-a605-e4e6870a554f)


```bash
eksctl create cluster \
--name dev \
--region=us-east-1 \
--nodegroup-name dev-workers \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--managed
```
Result: sucessfully created cluster

Logs
```bash
2023-03-05 11:45:55 [ℹ]  eksctl version 0.132.0-dev+15bffbb0d.2023-03-01T18:34:36Z
2023-03-05 11:45:55 [ℹ]  using region us-east-1
2023-03-05 11:45:56 [ℹ]  skipping us-east-1e from selection because it doesn't support the following instance type(s): t3.medium
2023-03-05 11:45:56 [ℹ]  setting availability zones to [us-east-1d us-east-1c]
2023-03-05 11:45:56 [ℹ]  subnets for us-east-1d - public:192.168.0.0/19 private:192.168.64.0/19
2023-03-05 11:45:56 [ℹ]  subnets for us-east-1c - public:192.168.32.0/19 private:192.168.96.0/19
2023-03-05 11:45:56 [ℹ]  nodegroup "standard-workers" will use "" [AmazonLinux2/1.24]
2023-03-05 11:45:56 [ℹ]  using Kubernetes version 1.24
2023-03-05 11:45:56 [ℹ]  creating EKS cluster "dev" in "us-east-1" region with managed nodes
2023-03-05 11:45:56 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2023-03-05 11:45:56 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-1 --cluster=dev'
2023-03-05 11:45:56 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "dev" in "us-east-1"
2023-03-05 11:45:56 [ℹ]  CloudWatch logging will not be enabled for cluster "dev" in "us-east-1"
2023-03-05 11:45:56 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-1 --cluster=dev'
2023-03-05 11:45:56 [ℹ]  
2 sequential tasks: { create cluster control plane "dev", 
    2 sequential sub-tasks: { 
        wait for control plane to become ready,
        create managed nodegroup "standard-workers",
    } 
}
2023-03-05 11:45:56 [ℹ]  building cluster stack "eksctl-dev-cluster"
2023-03-05 11:45:57 [ℹ]  deploying stack "eksctl-dev-cluster"
2023-03-05 11:46:27 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:46:57 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:47:58 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:48:58 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:49:59 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:50:59 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:52:00 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:53:00 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:54:00 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:55:01 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:56:01 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:57:02 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:58:02 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"
2023-03-05 11:59:03 [ℹ]  waiting for CloudFormation stack "eksctl-dev-cluster"

2023-03-05 12:01:06 [ℹ]  building managed nodegroup stack "eksctl-dev-nodegroup-standard-workers"
2023-03-05 12:01:07 [ℹ]  deploying stack "eksctl-dev-nodegroup-standard-workers"
2023-03-05 12:01:07 [ℹ]  waiting for CloudFormation stack "eksctl-dev-nodegroup-standard-workers"
2023-03-05 12:01:38 [ℹ]  waiting for CloudFormation stack "eksctl-dev-nodegroup-standard-workers"
2023-03-05 12:02:26 [ℹ]  waiting for CloudFormation stack "eksctl-dev-nodegroup-standard-workers"
2023-03-05 12:04:13 [ℹ]  waiting for CloudFormation stack "eksctl-dev-nodegroup-standard-workers"
2023-03-05 12:04:13 [ℹ]  waiting for the control plane to become ready
2023-03-05 12:04:13 [✔]  saved kubeconfig as "/Users/joseflores/.kube/config"
2023-03-05 12:04:13 [ℹ]  no tasks
2023-03-05 12:04:13 [✔]  all EKS cluster resources for "dev" have been created
2023-03-05 12:04:13 [ℹ]  nodegroup "standard-workers" has 3 node(s)
2023-03-05 12:04:13 [ℹ]  node "ip-192-168-0-97.ec2.internal" is ready
2023-03-05 12:04:13 [ℹ]  node "ip-192-168-55-145.ec2.internal" is ready
2023-03-05 12:04:13 [ℹ]  node "ip-192-168-63-96.ec2.internal" is ready
2023-03-05 12:04:13 [ℹ]  waiting for at least 1 node(s) to become ready in "standard-workers"
2023-03-05 12:04:13 [ℹ]  nodegroup "standard-workers" has 3 node(s)
2023-03-05 12:04:13 [ℹ]  node "ip-192-168-0-97.ec2.internal" is ready
2023-03-05 12:04:13 [ℹ]  node "ip-192-168-55-145.ec2.internal" is ready
2023-03-05 12:04:13 [ℹ]  node "ip-192-168-63-96.ec2.internal" is ready
2023-03-05 12:04:14 [ℹ]  kubectl command should work with "/Users/joseflores/.kube/config", try 'kubectl get nodes'
2023-03-05 12:04:14 [✔]  EKS cluster "dev" in "us-east-1" region is ready
```


# Issues and Troubleshooting
```bash
# failed with ACG
eksctl create cluster
```
CREATE_FAILED AWS::EKS::Cluster
```bash
Resource handler returned message: "Cannot create cluster 'beautiful-sheepdog-1677941291' because us-east-1e, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f (Service: Eks, Status Code: 400, Request ID: 225ffe28-f418-429b-96e7-057f2f31477e)" (RequestToken: 9f942d1a-00c4-1201-9cd6-d87dfb9cf3e1, HandlerErrorCode: InvalidRequest)	
```

```bash
eksctl create cluster --region=us-east-1 --zones=us-east-1a,us-east-1b,us-east-1d
```

CREATE_FAILED AWS::IAM::Role
```bash
API: iam:CreateRole User: arn:aws:iam::656306611222:user/cloud_user is not authorized to perform: iam:CreateRole on resource: arn:aws:iam::656306611222:role/eksctl-amazing-outfit-1677941955-clust-ServiceRole-14XGA5PPQI1V4 with an explicit deny in an identity-based policy	
```
```bash
eksctl create cluster --region=us-west-2
```

CREATE_FAILED AWS::IAM::Role
```bash
API: iam:CreateRole User: arn:aws:iam::656306611222:user/cloud_user is not authorized to perform: iam:CreateRole on resource: arn:aws:iam::656306611222:role/eksctl-amazing-badger-1677942218-clust-ServiceRole-1AVUDBA4EJ93S with an explicit deny in an identity-based policy	AWS::IAM::Role
2023-03-04 09:03:46 UTC-0600	ServiceRole	
CREATE_IN_PROGRESS
Did not have IAM permissions to process tags on AWS::IAM::Role resource.
```
