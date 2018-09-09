variable "region" {
  default = "us-east-1"
}
variable "vpcfullcidr" {
    default = "10.203.1.0/24"
  description = " VPC CIDR"
}

variable "subnet_public_AzA" {
  default = "10.203.1.0/27"
  description = "the cidr of the public subnet"
}


variable "subnet_private_AzA" {
  default = "10.203.1.32/27"
  description = "the cidr of the private subnet"
}

variable "subnet_public_AzB" {
  default = "10.203.1.64/27"
  description = "the cidr of the public subnet"
}

variable "subnet_private_AzB" {
  default = "10.203.1.96/27"
  description = "the cidr of the private subnet"
}


variable "az_b" {
  default     = "us-east-1a"
  description = "Your Az1, use AWS CLI to find your account specific"
}

variable "az_a" {
  default     = "us-east-1b"
  description = "Your Az2, use AWS CLI to find your account specific"
}


