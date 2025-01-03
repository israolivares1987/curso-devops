output "aws_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "route_internet_access_id" {
  value = aws_route.route_internet_access.id
}

output "aws_route_table_association_id" {
  value = aws_route_table_association.public_subnet_association.id
}



