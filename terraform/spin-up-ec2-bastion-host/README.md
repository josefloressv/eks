# Spin up an EC2 Bastion host instance
## Deploy infrastructure app
```bash
terraform init
terraform apply -auto-approve
```

## Destroy infrastructure
```bash
terraform destroy

# Check the Public IP in the output, will use in the next step
```

## Connect to EC2 Instance through SSH
```bash
ssh -i tf-key-pair ec2-user@EC2InstanceIP
```



## Thanks
- [HashiCorp Terraform Supports Amazon Linux 2](https://www.hashicorp.com/blog/hashicorp-terraform-supports-amazon-linux-2)
- [Terraform | Create AWS EC2 instance with key-pair](https://awstip.com/terraform-create-aws-ec2-instance-with-key-pair-ff541f9eec58)
- https://github.com/josefloressv/terraform-devops/tree/main/aws/ubuntu-terraform-security-group