# eksctl

## Create cluster
```bash
eksctl create cluster

eksctl create cluster --name dev --region us-east-1 --zones=us-east-1a,us-east-1b,us-east-1d --nodegroup-name standard-workers --node-type t3.medium --nodes 3 --nodes-min 1 --nodes-max 4 --managed
```

## Info cluster
```bash
eksctl get cluster
eksctl get cluster -n clusterName
eksctl get cluster -n clusterName -o json
```

## Node group
```bash
eksctl get nodegroup --cluster clusterName
eksctl get ng -c clusterName
eksctl get ng -c clusterName -o json
eksctl get ng -c clusterName -n NodeGroupName
```

## Delete a cluster
```bash
eksctl delete cluster clusterName
```

## Delete a nodegroup
```bash
eksctl delete ng -c clusterName NodeGroupName
```
