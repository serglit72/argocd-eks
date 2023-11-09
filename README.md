## ArgoCD Deployment to AWS EKS Clusters

This repository contains the configuration files and instructions for deploying ArgoCD to AWS EKS clusters in the dev, stage, and prod environments.

## Deployment pattern

![image](https://github.com/serglit72/argocd-eks/assets/13356713/0030e51f-33d8-410e-b304-8a05628bc6c6)


### Prerequisites

Before deploying ArgoCD, you must have the following:

- An AWS account with permissions to create EKS clusters and associated resources
- `kubectl` and `aws` CLI tools installed and configured
- A domain name and SSL certificate for the ArgoCD server (optional)

<!-- TODO: Create a shortcut to all TODOs -->
### Deployment Steps

1. Create an EKS cluster in the desired environment (dev, stage, or prod)
2. Configure `kubectl` to use the new cluster
3. Create a namespace for ArgoCD
4. Deploy the ArgoCD server and API components
5. Configure the ArgoCD server with the desired settings and applications
6. (Optional) Set up a domain name and SSL certificate for the ArgoCD server

For detailed instructions and configuration files, see the `dev/`, `stage/`, and `prod/` directories.



eksctl version

![image](https://github.com/serglit72/argocd-eks/assets/13356713/1f18e2de-222b-4e28-8754-657c1caff85c)
