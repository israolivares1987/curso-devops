data "aws_vpc" "vpc_pci" {
  cidr_block = var.vpc_cidr_block
}

data "aws_subnet" "subnet_public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_pci.id]
  }
  filter {
    name   = "tag:Name"
    values = ["subnet-public"]
  }
}