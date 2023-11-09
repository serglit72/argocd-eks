variable "eks_cluster_name" {
  description = "AWS EKS cluster name to deploy ArgoCD Master App"
  type        = string
}

variable "git_source_repoURL" {
  description = "Source file repoURL in Git to deploy to EKS by Master App"
  type        = string
}

variable "git_source_path" {
  description = "Source file Path in Git to deploy to EKS by Master App"
  type        = string
  default     = ""
}

variable "git_source_targetRevision" {
  description = "GitSource HEAD or Branch to Track and deploy to EKS by Master App"
  type        = string
  default     = "HEAD"
}
