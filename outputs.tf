output "id" {
  value       = mongodbatlas_database_user.this.id
  description = "Atlas User id"
}

output "project_id" {
  value       = data.mongodbatlas_project.project.id
  description = "Mongodb Atlas id"
}

