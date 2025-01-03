
# Salida del ID de la instancia EC2 creada
output "instance_id" {
  value = module.ec2.*.instance_id
}


# Salida del ARN VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

# Salida del ARN VPC
output "sg" {
  value = module.sg.aws_security_group_id
}

/*
# Salida del ARN SubNet
output "subnet_id" {# Salida del ARN VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}
  value = aws_subnet.main_subnet.arn
}


 */