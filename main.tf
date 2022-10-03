locals {
  name_prefix = substr("eks-ebs-csi-controller-${var.cluster_name}", 0, 32)
}

module "irsa_ebs_csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 4.2"

  create_role                  = true
  role_name                    = local.name_prefix
  provider_url                 = var.cluster_oidc_issuer_url
  role_policy_arns             = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]
  oidc_subjects_with_wildcards = ["system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"]
}
