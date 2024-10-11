module "ec2_instance" {
  source = "../modules/ubuntu_ec2" # Path to the EC2 instance module

  region           = var.region
  vpc_id           = aws_vpc.main_vpc.id
  project_name     = "my_awesome_project"
  subnet_id        = aws_subnet.public_subnet.id
  associate_public_ip = true
}