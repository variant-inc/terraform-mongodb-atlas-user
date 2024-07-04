# terraform-mongodb-atlas-user

<!-- markdownlint-disable MD033 MD013 MD041 -->

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.31.0 |
| <a name="requirement_mongodbatlas"></a> [mongodbatlas](#requirement\_mongodbatlas) | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.certificate](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.issuer](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_secret.tls_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [mongodbatlas_database_user.this](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/database_user) | resource |
| [aws_secretsmanager_secret.certificate_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.certificate_secret_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [mongodbatlas_project.project](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ca_secret_arn"></a> [ca\_secret\_arn](#input\_ca\_secret\_arn) | ARN of the secret containing issuer details | `string` | n/a | yes |
| <a name="input_certificate_labels"></a> [certificate\_labels](#input\_certificate\_labels) | (Optional) Labels on certificate resource | `map(string)` | `{}` | no |
| <a name="input_certificate_name"></a> [certificate\_name](#input\_certificate\_name) | (Required) Name of the certificate created | `string` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | (Required) Name of cluster that this user has access to | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Common name of certificate | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Required) Namespace where certificate resource will be created | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | (Optional) Organization of the certificate | `string` | `"usxpress"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Required) The unique ID for the project to create the database user. | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | roles = {<br>      name = (Required) Name of the role to grant.<br>      database = (Required) Database on which the user has the specified role.<br>      collection = (Optional) Collection for which the role applies.<br>                        You can specify a collection for the read and readWrite roles.<br>                        If you do not specify a collection for read and readWrite,<br>                        the role applies to all collections in the database<br>    } | <pre>list(object({<br>    name       = string<br>    database   = string<br>    collection = optional(string, null)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Containing key-value pairs that tag and categorize the database user.<br>    Each key and value has a maximum length of 255 characters. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Atlas User id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
