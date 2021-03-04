variable "region" {
  default     = "us-east-2"
  description = "Main region"
}

variable "access_key" {
  default = "AKIA3PHJCLJKYAJKKBN7"
}

variable "secret_key" {
  default = "26Dji+QA3afH4hvw1KP9UPXv8Ti8tKBEcKXApxbP"
}


variable "ami_azm-lnx" {
  default = "ami-09246ddb00c7c4fef"
}

#variable "ips" {
#  type = "list"
#  default = ["684D:1111:222:3333:4444:5555:6:77"]
#}

variable "tags" {
  #type = "map"
  default = {
    "Name" = "DanielRicci"
    "Env"  = "Dev"
  }
}

variable "region_number" {
  # Arbitrary mapping of region name to number to use in
  # a VPC's CIDR prefix.
  default = {
    us-east-1      = 1
    us-west-1      = 2
    us-west-2      = 3
    eu-central-1   = 4
    ap-northeast-1 = 5
    us-east-2      = 6
  }
}

variable "az_number" {
  # Assign a number to each AZ letter used in our configuration
  default = {
    a = 1
    b = 2
    c = 3
    d = 4
    e = 5
    f = 6
  }
}