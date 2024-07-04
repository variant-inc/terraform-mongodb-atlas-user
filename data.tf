data "mongodbatlas_project" "project" {
  name = var.project_name
}

data "aws_secretsmanager_secret" "certificate_secret" {
  arn = var.ca_secret_arn
}

data "aws_secretsmanager_secret_version" "certificate_secret_data" {
  secret_id = data.aws_secretsmanager_secret.certificate_secret.id
}
