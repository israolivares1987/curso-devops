resource "aws_internet_gateway" "gw_curso_devops" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.internet_gw_name
  }
}