variable "instance_AMI" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ami-0b614a5d911900a9b"
}

variable "instance_type" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_key" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "test"
}

variable "instance_region" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "us-east-2"
}

variable "instance_accesskey" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = ""
}
variable "instance_secretkey" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = ""
}
variable "sg_ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "test"
        },
        {
          from_port   = 23
          to_port     = 23
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "test"
        },
    ]
}


