locals {
  subject       = "CN=${var.name},O=${var.organization}"
  issuer_secret = jsondecode(data.aws_secretsmanager_secret_version.certificate_secret_data.secret_string)
}
