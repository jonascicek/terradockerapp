terraform {
  backend "s3" {
    bucket = "terraform-state-jonas-2025"
    key    = "terraform/state/my-iaC-project.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}
