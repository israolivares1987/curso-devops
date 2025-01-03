
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
}

resource "aws_route" "route_internet_access" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.internet_gw_id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.public_route_table.id
}