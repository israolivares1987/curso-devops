# Definición de valores específicos para las variables

aws_region                = "us-east-1"
instance_type             = "t2.micro"
key_name                  = "TestDevOps"
vpc_cidr_block            = "192.168.0.0/16"
subnet_cidr_block        =  ["192.168.1.0/24","192.168.2.0/24"]

sg_config = {
    ingress_rules = [
      {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["192.168.1.0/24", "192.168.2.0/24"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["192.168.1.0/24", "192.168.2.0/24"]
      },
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["192.168.1.0/24", "192.168.2.0/24"]
      }
   ]
    egress_rules = [
      {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      }
    ]
 }
