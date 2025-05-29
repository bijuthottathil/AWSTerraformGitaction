terraform {
  backend "s3" {
    use_lockfile = true
    region       = "us-west-2"
  }
}
