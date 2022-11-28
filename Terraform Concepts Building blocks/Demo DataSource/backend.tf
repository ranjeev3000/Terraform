terraform {
  backend "s3" {
      bucket    = "tf-state-98ft"
      key       = "development/terraform_state"
      region    = "us-east-1"
  }
}