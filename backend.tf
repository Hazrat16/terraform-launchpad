# Replace the example bucket name before running terraform init -migrate-state.

terraform {
  backend "s3" {
    bucket       = "nure-64573-bucket-123"
    key          = "terraform-launchpad/dev/terraform.tfstate"
    region       = "us-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
