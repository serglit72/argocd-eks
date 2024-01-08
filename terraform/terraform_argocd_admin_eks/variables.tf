variable "eks_cluster_name" {
  description = "EKS Cluster name to deploy ArgoCD ADMIN Application"
  type        = string
}

variable "git_source_repoURL" {
  description = "GitSource repoURL to Track and deploy to EKS by ADMIN Application"
  type        = string
}

variable "git_source_path" {
  description = "GitSource Path in Git Repository to Track and deploy to EKS by ADMIN Application"
  type        = string
  default     = ""
}

variable "git_source_targetRevision" {
  description = "GitSource HEAD or Branch to Track and deploy to EKS by ADMIN Application"
  type        = string
  default     = "HEAD"
}
