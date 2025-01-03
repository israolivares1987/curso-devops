variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    cidr_blocks = list(string)
    protocol    = string
  }))
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    cidr_blocks = optional(list(string))
    protocol    = string
  }))
}