provider "aws" {}

terraform {
  backend "s3" {
    bucket = "lakshmaiahaws.xyz"
    key    = "PROJECT/TEST/terraform.tfstate"
    region = "us-east-1"
  }
}

