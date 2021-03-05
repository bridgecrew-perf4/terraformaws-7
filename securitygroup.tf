resource "aws_security_group" "sg1" {
  name        = "sg_libera_porta_22"
  description = "allows ssh protocol"
  vpc_id      = aws_vpc.VPC-EKS.id

  ingress {
    description = "Allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_vpc.VPC-EKS,
  ]

  tags = {
    Name = "sg_libera_porta_22"
  }
}

resource "aws_security_group" "sg2" {
  name        = "sg_libera_porta_80"
  description = "allows http protocol"
  vpc_id      = aws_vpc.VPC-EKS.id

  ingress {
    description = "Allow ssh"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_vpc.VPC-EKS,
  ]

  tags = {
    Name = "sg_libera_porta_80"
  }
}


resource "aws_security_group" "sg3" {
  name        = "sg_libera_3306"
  description = "allows MYSQL protocol"
  vpc_id      = aws_vpc.VPC-EKS.id

  ingress {
    description     = "Allow ssh"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sg1.id, aws_security_group.sg2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_security_group.sg1,
    aws_security_group.sg2,
  ]

  tags = {
    Name = "sg_libera_3306"
  }
}