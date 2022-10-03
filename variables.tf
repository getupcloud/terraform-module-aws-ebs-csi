variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "URL of the OIDC Provider from the EKS cluster"
  type        = string
}

variable "service_account_namespace" {
  description = "Namespace of ServiceAccount for EBS CSI controller"
  default     = "csi-drivers"
}

variable "service_account_name" {
  description = "ServiceAccount name for EBS CSI controller"
  default     = "ebs-csi-controller-sa"
}
