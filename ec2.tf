resource "aws_network_interface" "rede1" {
  subnet_id   = aws_subnet.subnet1.id
  private_ips = ["10.150.1.10"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "vm1" {
  ami                    = "ami-09246ddb00c7c4fef" # us-west-2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  key_name               = "teste-key"
  vpc_security_group_ids = [aws_security_group.sg1.id, aws_security_group.sg2.id]
  #network_interface {
  #  network_interface_id = aws_network_interface.rede1.id
  #  device_index         = 0
  #}
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
  ami                    = "ami-09246ddb00c7c4fef" # us-west-2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet2.id
  key_name               = "teste-key"
  vpc_security_group_ids = [aws_security_group.sg1.id, aws_security_group.sg3.id]
  #network_interface {
  #  network_interface_id = aws_network_interface.rede1.id
  #  device_index         = 0
  #}
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


