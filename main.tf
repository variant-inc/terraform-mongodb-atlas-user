locals {
  subject = "CN=${var.name.cn},O=usxpress"
}

resource "mongodbatlas_database_user" "this" {
  username           = local.subject
  project_id         = var.project_id
  auth_database_name = "$external"
  x509_type          = "CUSTOMER"

  dynamic "roles" {
    for_each = var.roles
    content {
      role_name       = roles.value.role_name
      database_name   = roles.value.database_name
      collection_name = roles.value.collection_name
    }
  }

  dynamic "labels" {
    for_each = var.labels
    content {
      key   = labels.key
      value = labels.value
    }
  }

  dynamic "scopes" {
    for_each = var.scoped_cluster
    content {
      name = scopes.value
      type = "CLUSTER"
    }
  }
}

module "certificate" {
  source                = "./modules/certificate"
  name                  = var.certificate.name
  namespace             = var.certificate.namespace
  annotations           = var.certificate.annotations
  secret_name           = var.certificate.secret_name
  secret_annotations    = var.certificate.secret_annotations
  secret_labels         = var.certificate.secret_labels
  duration              = var.certificate.duration
  renew_before          = var.certificate.renew_before
  is_ca                 = var.certificate.is_ca
  literalSubject        = local.subject
  private_key_algorithm = var.certificate.private_key_algorithm
  private_key_encoding  = var.certificate.private_key_encoding
  private_key_size      = var.certificate.private_key_size
  usages                = var.certificate.usages
  issuer_name           = var.certificate.issuer_name
  issuer_kind           = var.certificate.issuer_kind
  issuer_group          = var.certificate.issuer_group
}

resource "kubernetes_manifest" "certificates" {
  manifest = yamlencode(module.certificate.certificate_data)
}

