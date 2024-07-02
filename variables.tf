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
}

variable "tags" {
  type        = map(string)
  description = <<EOF
    Containing key-value pairs that tag and categorize the database user.
    Each key and value has a maximum length of 255 characters.
  EOF
  default     = {}
}

variable "cluster" {
  type        = string
  description = "(Required) Name of cluster that this user has access to"
}

variable "namespace" {
  type        = string
  description = "(Required) Namespace where certificate resource will be created"
}

# variable "certificate_name" {
#   type        = string
#   description = "(Required) Name of the certificate created"
# }

variable "certificate_labels" {
  type        = map(string)
  description = "(Optional) Labels on certificate resource"
  default     = {}
}
