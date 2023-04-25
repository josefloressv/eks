# Associate with K8 Lens IDE
https://unofficialaciguide.com/2022/01/01/k8s-lens-ide-on-aws-aci-eks-infrastructure/

1. Just create a new AWS profile

```bash
aws configure --profile lensuser

# test
aws sts get-caller-identity --profile lensuser
```
2. Modify the KubeConfig configuration for the EKS cluster
```bash
vi ~./.kube/config
# Add to the EKS context
      - name: AWS_PROFILE
        value: lensuser
```

example
```bash
- name: cloud_user@dev.us-east-1.eksctl.io
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - token
      - -i
      - dev
      command: aws-iam-authenticator
      env:
      - name: AWS_STS_REGIONAL_ENDPOINTS
        value: regional
      - name: AWS_DEFAULT_REGION
        value: us-east-1
      - name: AWS_PROFILE
        value: lensuser
      provideClusterInfo: false
```
