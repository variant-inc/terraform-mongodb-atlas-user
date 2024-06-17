variable "name" {
  type = object({
    cn = string
  })
  description = <<EOF
    name = {
      cn = (Required) Username for authenticating to MongoDB.
    }
  EOF
}

variable "project_id" {
  type        = string
  description = "(Required) The unique ID for the project to create the database user."
}

variable "roles" {
  type = list(object({
    role_name       = string
    database_name   = string
    collection_name = optional(string, null)
  }))

  description = <<EOF
    roles = {
      role_name = (Required) Name of the role to grant.
      database_name = (Required) Database on which the user has the specified role.
      collection_name = (Optional) Collection for which the role applies.
                        You can specify a collection for the read and readWrite roles.
                        If you do not specify a collection for read and readWrite,
                        the role applies to all collections in the database
    }
  EOF
}

variable "labels" {
  type        = map(string)
  description = <<EOF
    Containing key-value pairs that tag and categorize the database user.
    Each key and value has a maximum length of 255 characters.
  EOF
  default     = null
}

variable "scoped_cluster" {
  type        = list(string)
  description = <<EOF
    Array of clusters that this user has access to.
    If omitted, Atlas grants the user access to all the clusters
  EOF
  default     = null
}

variable "certificate" {
  type = object({
    name                  = string
    namespace             = string
    annotations           = optional(map(string), {})
    secret_name           = string
    secret_annotations    = optional(map(string), {})
    secret_labels         = optional(map(string), {})
    duration              = optional(string, "2160h")
    renew_before          = optional(string, "360h")
    is_ca                 = optional(bool, false)
    private_key_algorithm = optional(string, "RSA")
    private_key_encoding  = optional(string, "PKCS1")
    private_key_size      = optional(number, 2048)
    usages                = optional(list(string), ["server auth", "client auth"])
    issuer_name           = string
    issuer_kind           = optional(string, "ClusterIssuer")
    issuer_group          = optional(string, "cert-manager.io")
  })
}
