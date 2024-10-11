module "root" {
    source = "../"
    env = var.env
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
}