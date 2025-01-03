# Creación de una Subred en la VPC
resource "aws_subnet" "main_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.subnet_availability_zone

  tags = {
    Name = var.subnet_cidr_block == "192.168.1.0/24" ? "subnet-public" : "subnet-private"
  }
}
