provider "aws" {
  region                   = "eu-west-1"
  shared_config_files      = ["$HOME/.aws/credentials"]
  shared_credentials_files = ["$HOME/.aws/credentials"]

  default_tags {
    tags = {
      ManagedByTerraform   = "YES"
      environment          = "dev"
    }
  }
}

terraform {
  backend "s3" {
    shared_credentials_file = "$HOME/.aws/credentials"
    profile                 = "dev"
    bucket                  = "remote-state"
    key                     = "dev/terraform.state"
    region                  = "eu-west-1"
    encrypt                 = true
    dynamodb_table          = "state-locks"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60.0"
    }
  }
}
