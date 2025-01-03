# Definición de variables

variable "aws_region" {
  description = "La región de AWS donde se desplegará la infraestructura"
  type        = string
}

variable "vpc_cidr_block" {
  description = "El bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "El bloque CIDR para la subred 1"
  type        = list(string)
  default     = ["192.168.1.0/24","192.168.2.0/24"]
}

variable "instance_type" {
  description = "El tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "El nombre de la clave SSH para la instancia EC2"
  type        = string
}

variable "sg_config"{
  type = object({
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}

