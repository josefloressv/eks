# EKS Automation - Automate EKS 1.25 Cluster in 18 minutes by Yongkang | Kubernetes Automation

[![EKS Automation - Automate EKS 1.25 Cluster in 18 minutes by Yongkang | Kubernetes Automation](https://img.youtube.com/vi/OUVv4PZhW9c/0.jpg)](https://www.youtube.com/watch?v=OUVv4PZhW9c)

Code repository 
https://github.com/yongkanghe/eks-casa

# Steps

## Here're the prerequisities. 
1. Go to open AWS Cloud Shell
2. Clone the github repo (I made some modifications), run below command
````
git clone https://github.com/josefloressv/eks-casa.git
````
3. Install the required tools (eksctl, kubectl, helm)
````
cd eks-casa;./awsprep.sh;. ./setenv.sh
````
4. Optionally, you can customize the clustername, instance-type, zone, region
````
vi setenv.sh
````

# EKS Cluster Automation 

1. To deploy an EKS cluster
````
./eks-deploy.sh
````

2. To destroy the EKS cluster after testing
````
./eks-destroy.sh
````