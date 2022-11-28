terraform {
  backend "s3-bucket" {
      bucket    = "tf-state-98ft"
      key       = "development/terraform_state"
      region    = "us-east-1"
  }
}