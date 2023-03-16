# Getting started
 Prerequisites
- IAM permissions
- AWS CLI
- `kubectl`
- `eksctl`

## Installing tools
- [Getting started with Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
- [Getting started with Amazon EKS – AWS Management Console and AWS CLI](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html)
- [Kubernetes - Install Tools](https://kubernetes.io/docs/tasks/tools/#kubectl)

### AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
MacOS
```bash
brew install awscli

# Check
aws --version
```

Linux
```bash
curl --silent "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -qq awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin/ --install-dir /usr/local/bin/ --update
rm -rf awscliv2.zip aws

# Check
aws --version
```
### kubectl
https://kubernetes.io/docs/tasks/tools/

MacOs
```bash
brew install kubectl

# check
kubectl version --client
```

Linux
```bash
curl --silent -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod 755 kubectl
sudo mv kubectl /usr/local/bin/

# check
kubectl version --client
```

### eksctl
https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html

MacOS
```bash
brew install eksctl

# Check
eksctl version
```

Linux
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Check
eksctl version
```

## Basic eksctl commands
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
Optional kubectl configurations and plugins
Enable shell autocompletion 
```bash
source <(kubectl completion zsh)
```