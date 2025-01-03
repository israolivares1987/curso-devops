variable "ami_id" {
  description = "ID de la AMI"
  type        = string
}

variable "instance_type" {
  description = "El tipo de instancia EC2"
  type        = string
}

variable "instance_name" {
  description = "El Nombre de instancia EC2"
  type        = string
}

variable "sg_id" {
  description = "ID del Security Group"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subred donde se lanzará la instancia EC2"
  type        = string
}

variable "key_name" {
  description = "Nombre del Key EC2"
  type        = string
}

variable "associate_public_ip_address" {
  type   = bool
}

