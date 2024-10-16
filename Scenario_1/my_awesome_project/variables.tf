variable "env" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type    = string
}

variable "public_subnet_cidr" {
  type = string
}