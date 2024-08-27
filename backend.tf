terraform {
  backend "s3" {
    bucket = "aws-containers-vpc"
    key    = "vpc/terraform.tfstate"
    region = var.region
  }
}