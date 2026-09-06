provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      environment = "bootstrap"
      managedBy   = "terraform"
    }
  }
}