provider "aws" {
   region     = var.instance_region
   access_key = 
   secret_key = 
   
}

module "instance1" {
    
    source = "https://github.com/jaison-baby/TerraForm_Learning/blob/master/variables.tf"
    ami = var.instance_AMI  
    instance_type = var.instance_type 
    key_name= var.instance_key
    vpc_security_group_ids = [aws_security_group.main.id]
}
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
}
module "inbondrules" {
  source = "https://github.com/jaison-baby/TerraForm_Learning/blob/master/variables.tf"
  count = length(var.sg_ingress_rules)

  type              = "ingress"
  from_port         = var.sg_ingress_rules[count.index].from_port
  to_port           = var.sg_ingress_rules[count.index].to_port
  protocol          = var.sg_ingress_rules[count.index].protocol
  cidr_blocks       = [var.sg_ingress_rules[count.index].cidr_block]
  description       = var.sg_ingress_rules[count.index].description
  security_group_id = aws_security_group.main.id
}

