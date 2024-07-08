provider "aws" {
  alias  = "cross_account"
  region = local.cross_account_region
}
