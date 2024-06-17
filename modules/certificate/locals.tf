locals {
  name                  = var.name
  namespace             = var.namespace
  annotations           = var.annotations
  secret_name           = var.secret_name
  secret_annotations    = var.secret_annotations
  secret_labels         = var.secret_labels
  duration              = var.duration
  renew_before          = var.renew_before
  is_ca                 = var.is_ca
  literalSubject        = var.literalSubject
  private_key_algorithm = var.private_key_algorithm
  private_key_encoding  = var.private_key_encoding
  private_key_size      = var.private_key_size
  usages                = var.usages
  issuer_name           = var.issuer_name
  issuer_kind           = var.issuer_kind
  issuer_group          = var.issuer_group
}