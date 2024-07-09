variable "name" {
  type        = string
  description = "(Required) Common name of certificate"
}

variable "organization" {
  type        = string
  description = "(Optional) Organization of the certificate"
  default     = "usxpress"
}

variable "project_name" {
  type        = string
  description = "(Required) The unique ID for the project to create the database user."
}

variable "roles" {
  type = list(object({
    name       = string
    database   = string
    collection = optional(string, null)
  }))

  description = <<EOF
    roles = {
      name = (Required) Name of the role to grant.
      database = (Required) Database on which the user has the specified role.
      collection = (Optional) Collection for which the role applies.
                        You can specify a collection for the read and readWrite roles.
                        If you do not specify a collection for read and readWrite,
                        the role applies to all collections in the database
    }
  EOF

  validation {
    condition     = alltrue([for role in var.roles : contains(["read", "readWrite"], role.name)])
    error_message = "Each role must have a valid 'name' ('read' or 'readWrite')"
  }
}

variable "tags" {
  type        = map(any)
  description = "Tags to be applied to resources"
}

variable "cluster" {
  type        = string
  description = "(Required) Name of cluster that this user has access to"
}

variable "namespace" {
  type        = string
  description = "(Required) Namespace where certificate resource will be created"
}

variable "ca_secret_arn" {
  type        = string
  description = "ARN of the secret containing issuer details"
}

variable "certificate_name" {
  type        = string
  description = "(Required) Name of the certificate created"
}
