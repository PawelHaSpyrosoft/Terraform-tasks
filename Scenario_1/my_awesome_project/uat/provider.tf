provider "aws" {
  region                   = "eu-central-1"
  shared_config_files      = ["$HOME/.aws/credentials"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile = "uat"

  default_tags {
    tags = {
      ManagedByTerraform   = "YES"
      environment          = "uat"
    }
  }
}

terraform {
  backend "s3" {
    shared_credentials_file = "$HOME/.aws/credentials"
    profile                 = "uat"
    bucket                  = "my-remote-bucket-terraform-task-9123"
    key                     = "uat/terraform.state"
    region                  = "eu-central-1"
    encrypt                 = true
    dynamodb_table          = "state-locks"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70.0"
    }
  }
}
