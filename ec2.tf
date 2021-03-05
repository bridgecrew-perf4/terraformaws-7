resource "aws_instance" "vm1" {
  ami                    = var.ami_azm-lnx
  instance_type          = var.type-default
  subnet_id              = aws_subnet.subnet1.id
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.sg1.id, aws_security_group.sg2.id]
  depends_on = [
    aws_subnet.subnet1,
    aws_security_group.sg1,
    aws_security_group.sg2,
    aws_key_pair.teste,
  ]
  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    Name = "VM1"
  }
}

resource "aws_instance" "vm2" {
  ami                    = var.ami_azm-lnx
  instance_type          = var.type-default
  subnet_id              = aws_subnet.subnet2.id
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.sg1.id, aws_security_group.sg3.id]
  depends_on = [
    aws_subnet.subnet2,
    aws_security_group.sg1,
    aws_security_group.sg3,
    aws_key_pair.teste,
  ]
  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    Name = "VM2"
  }
}


