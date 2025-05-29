terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-biju"
    key            = "s3-bucket-terraform/dev/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}
