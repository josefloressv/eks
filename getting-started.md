# Getting started
https://eksctl.io/
>eksctl is a simple CLI tool for creating and managing clusters on EKS - Amazon's managed Kubernetes service for EC2. It is written in Go, uses CloudFormation, was created by Weaveworks and it welcomes contributions from the community.


## Installing tools
- [Getting started with Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
- [Getting started with Amazon EKS – AWS Management Console and AWS CLI](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html)
### Prerequisites
- AWS CLI
- `kubectl`
- IAM permissions
- `eksctl`

#### eksctl
https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html

MacOS
```bash
brew install eksctl
```

Linux
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
aws-iam-authenticator help
```

