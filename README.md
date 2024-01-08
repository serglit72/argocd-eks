## ArgoCD Deployment to AWS EKS HA Clusters

This repository contains the configuration files and instructions for deploying ArgoCD to AWS EKS clusters in the dev / stage and prod environments.

## Deployment pattern

![image](https://github.com/serglit72/argocd-eks/assets/13356713/1f18e2de-222b-4e28-8754-657c1caff85c)

### Prerequisites

Before deploying ArgoCD, you must have the following:

- An AWS account with permissions to create EKS clusters and associated resources
- `kubectl` and `aws` CLI tools installed and configured
- A domain name and SSL certificate for the ArgoCD server (optional)
- eksctl installed
NOTE! eksctl created a kubectl config file in ~/.kube or added the new cluster's configuration within an existing config file in ~/.kube.

Create a EKS using file "eks_cluster_dev.yaml"

```shell
eksctl create cluster -f eks_cluster_dev.yaml
```
Repeat tasks for PROD claster when ready:
```shell
eksctl create cluster -f eks_cluster_prod.yaml
```



### Deployment Steps



1. Go to "cluster_conf" folder and run eksctl commands to create EKS clustres:

Create EKS clusters in the desired environment (dev, stage, or prod)
```shell
cd cluster_conf
eksctl create cluster -f eks_cluster_dev.yaml
```
it takes 5-10 mins to get it ready.

2. Configure `kubectl` to use the new cluster . To switch to another cluster use the corresponded cluster name

```shell
aws eks update-kubeconfig --name dev
```
3. Deploy the ArgoCD server and API components

```shell
cd terraform
terraform init
terraform plan
terraform apply
```
4. Once deployed go to get Password for ArgoCD (repeat it for DEV, STAGE and PROD env)

```shell
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
In output: v7zsMfACEB6TBllN   #example KfeEDzCCv4-BBLLq

5. Configure the ArgoCD server with the desired settings (SSH keys generating)

```shell
cd terraform 
mkdir keys
cd keys && ssh-keygen

<output: > Generating public/private rsa key pair.
Enter file in which to save the key (/Users/serg/.ssh/id_rsa): argocd
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in argocd
Your public key has been saved in argocd.pub
......
```
Then copy PUBLIC KEY to GitHub repo in Settings/Deployment keys

```shell
cd keys && cat argocd.pub
```
And PRIVATE KEY to ArgoCD Settings/Repository/Connect (for ALL environments will be setup the SAME Pivate Key)

6. (Optional) Set up a domain name and SSL certificate for the ArgoCD server


