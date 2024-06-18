resource "mongodbatlas_database_user" "this" {
  username           = local.subject
  project_id         = data.mongodbatlas_project.project.id
  auth_database_name = "$external"
  x509_type          = "CUSTOMER"

  dynamic "roles" {
    for_each = var.roles
    content {
      role_name       = roles.value.name
      database_name   = roles.value.database
      collection_name = roles.value.collection
    }
  }

  dynamic "labels" {
    for_each = var.tags
    content {
      key   = labels.key
      value = labels.value
    }
  }

  scopes {
    name = var.cluster
    type = "CLUSTER"
  }
}
