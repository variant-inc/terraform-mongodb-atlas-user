terraform {
  required_version = "~> 1.1"
  backend "s3" {}
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.0"
    }
  }
}
