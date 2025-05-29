provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source      = "../../modules/s3-bucket"
  bucket_name = var.bucket_name
  acl         = var.acl
  tags        = var.tags
}
