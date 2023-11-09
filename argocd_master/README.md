# Module to deploy ArgoCD Master Applicaiton to EKS

Example to use:

```
module "argocd_master" {
  source             = "./argocd_master"
  eks_cluster_name   = "devops"
  git_source_path    = "devops/applications"
  git_source_repoURL = "git@github.com:serglit72/argocd-eks.git"
}
```