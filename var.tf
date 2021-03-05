variable "region" {
  type    = string
  default = "us-east-2"
}

variable "ami_azm-lnx" {
  type    = string
  default = "ami-09246ddb00c7c4fef"
}

variable "type-default" {
  type    = string
  default = "t2.micro"
}

variable "key" {
  type    = string
  default = "teste-key"
}

variable "subnet-public" {
  type    = string
  default = "10.150.1.0/24"
}

variable "subnet-private-b" {
  type    = string
  default = "10.150.2.0/24"
}

variable "subnet-private-c" {
  type    = string
  default = "10.150.3.0/24"
}

variable "public-zone-a" {
  type    = string
  default = "us-east-2a"
}

variable "private-zone-b" {
  type    = string
  default = "us-east-2b"
}

variable "private-zone-c" {
  type    = string
  default = "us-east-2c"
}

variable "public_ip" {
  type    = bool
  default = "true"
}

variable "subnet-vcp" {
  type    = string
  default = "10.150.0.0/22"
}

variable "tags" {
  #type = "map"
  default = {
    "Name" = "DanielRicci"
    "Env"  = "Dev"
  }
}

