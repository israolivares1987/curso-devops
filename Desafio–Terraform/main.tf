# Módulo VPC
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

# Módulo Subnet
module "subnet" {
  count                    = length(var.subnet_cidr_block)
  source                   = "./modules/subnet"
  vpc_id                   = module.vpc.vpc_id
  subnet_cidr_block        = var.subnet_cidr_block[count.index]
  subnet_availability_zone = count.index == 0 ? "us-east-1a" : "us-east-1b"
}

#Modulo IGW
module "igw" {
  source           = "./modules/igw"
  vpc_id           = module.vpc.vpc_id
  internet_gw_name = local.internet_gw_name
}

#Modulo Route
module "route" {
  source         = "./modules/route"
  vpc_id         = module.vpc.vpc_id
  internet_gw_id = module.igw.aws_internet_gateway_id
  subnet_id      = data.aws_subnet.subnet_public.id
}

#Module SG
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  ingress_rules = var.sg_config.ingress_rules
  egress_rules = var.sg_config.egress_rules
}


# Módulo EC2
module "ec2" {
  count         = length(var.subnet_cidr_block)
  source        = "./modules/ec2"
  ami_id        = "ami-0ca9fb66e076a6e32"
  instance_type = var.instance_type
  subnet_id     = module.subnet[count.index].subnet_id
  instance_name = local.instance_name
  key_name      = var.key_name
  sg_id         = module.sg.aws_security_group_id
  associate_public_ip_address = count.index == 0 ? true : false
}



