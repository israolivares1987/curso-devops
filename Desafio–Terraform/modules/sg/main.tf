# Definición de un grupo de seguridad para la instancia EC2
resource "aws_security_group" "instance_sg" {
  name        = "sgp-terraform-curso-devops"
  description = "Security group for EC2 instance"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = toset(var.ingress_rules)
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      cidr_blocks = ingress.value.cidr_blocks
      protocol    = ingress.value.protocol

    }
  }

  dynamic "egress" {
    for_each = toset(var.egress_rules)
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      cidr_blocks = egress.value.cidr_blocks
      protocol    = egress.value.protocol
    }
  }
}