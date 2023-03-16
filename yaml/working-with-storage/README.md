# Working with Storage
- [Storage Classes](https://kubernetes.io/docs/concepts/storage/storage-classes/#the-storageclass-resource)

Hands-on
```bash
# Creating the Storage Class
kubectl apply -f 01-storage.yaml
kubectl get storageclasses

# Creating a volume
kubectl apply -f 02-pvc.yaml
kubectl get pvc
# you can check in AWS Console EC2>Elastic Block Store>Volumes
```

# Thanks
- [EBS CSI Driver in AWS EKS (Elastic kubernetes service) - Complete easy setup](https://www.youtube.com/watch?v=B0CGyboZnjg)
- https://gitlab.com/sudarshanlnx1/kube-deplpy/-/tree/main/
