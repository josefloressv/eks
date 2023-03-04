# Create default cluster
https://eksctl.io/

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