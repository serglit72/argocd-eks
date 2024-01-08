module "argocd_dev" {
  source           = "./terraform_argocd_eks"
  eks_cluster_name = "dev"
  chart_version    = "5.52.1"
}


module "argocd_prod" {
  source           = "./terraform_argocd_eks"
  eks_cluster_name = "prod"
  chart_version    = "5.50.1"
}


#******* Uncomment and deploy ONLY after ArgoCD deployment: depends_on = [module.argocd_dev]

# module "argocd_dev_admin" {
#   source             = "./terraform_argocd_admin_eks"
#   eks_cluster_name   = "dev"
#   git_source_path    = "dev/apps"
#   git_source_repoURL = "git@github.com:serglit72/argocd-devops.git"
# }

# # Can be deployed ONLY after ArgoCD deployment: depends_on = [module.argocd_prod]
# module "argocd_prod_admin" {
#   source             = "./terraform_argocd_admin_eks"
#   eks_cluster_name   = "prod"
#   git_source_path    = "prod/apps"
#   git_source_repoURL = "git@github.com:serglit72/argocd-devops.git"
# }
