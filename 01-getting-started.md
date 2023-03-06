# Getting started

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

### Basic eksctl commands
```bash
eksctl get cluster
```

## Utils
Decode encoded messages
```bash
aws sts decode-authorization-message --encoded-message (encoded error message) --query DecodedMessage --output text | jq '.'
```

Install jq tool
```bash
brew install jq
```