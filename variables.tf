variable "name" {
  type = object({
    cn = string
  })
}

variable "project_id" {
  type = string
}

variable "roles" {
  type = list(object({
    role_name       = string
    database_name   = string
    collection_name = optional(string, null)
  }))
}

variable "labels" {
  type = map(string)
}

variable "scoped_cluster" {
  type = list(string)
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