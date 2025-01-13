# How to Run
1. Deploy with Terraform commands
```bash
terraform init
terraform plan
terraform apply
```
3. Connect to the EKS cluster
```bash
# List EKS clusters
aws eks list-clusters --output table

# Connect to the AKS cluster
aws eks --region us-east-1 update-kubeconfig --name guru-eks-sb1X3ABK
```