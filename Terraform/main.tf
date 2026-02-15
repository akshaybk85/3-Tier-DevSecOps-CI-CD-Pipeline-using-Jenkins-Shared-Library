module "vpc" {
  source = "./modules/VPC"

  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "ap-south-1a"

}

module "Jenkins_ec2" {

  source        = "./modules/EC2"
  aws_region    = var.aws_region
  instance_type = var.instance_type
  subnet_cidr     = var.subnet_cidr
  key_name      = var.key_name
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
  my_ip = chomp(data.http.my_ip.response_body)

}
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}
