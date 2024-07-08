provider "mongodbatlas" {}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
provider "aws" {
  alias  = "cross_account"
  region = local.cross_account_region
}
