variable "vpc_id"  {}
variable "public_subnet_id_AZA" {}
variable "private_subnet_id_db_AZA" {}
//variable "private_subnet_id_web_AZA" {}
variable "public_subnet_id_AZB" {}
variable "private_subnet_id_db_AZB" {}
//variable "private_subnet_id_web_AZB" {}

// Internet Gateway
resource "aws_internet_gateway" "gw" {
   vpc_id = "${var.vpc_id}"
    tags {
        Name = "internet gw terraform generated"
    }
}



// EIP for Nat Gateway for AZ -A
resource "aws_eip" "eip_forNat_AZA" {
    vpc      = true
}
resource "aws_nat_gateway" "NatGateway_AZA" {
   allocation_id = "${aws_eip.eip_forNat_AZA.id}"
    subnet_id = "${var.public_subnet_id_AZA}"
    depends_on = ["aws_internet_gateway.gw"]
}

// EIP for Nat Gateway for AZ -B
resource "aws_eip" "eip_forNat_AZB" {
    vpc      = true
}
resource "aws_nat_gateway" "NatGateway_AZB" {
   allocation_id = "${aws_eip.eip_forNat_AZB.id}"
    subnet_id = "${var.public_subnet_id_AZB}"
    depends_on = ["aws_internet_gateway.gw"]
}

// Public Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = "${var.vpc_id}"
  tags {
      Name = "Public_RT"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

// Private Route Table for AZB

resource "aws_route_table" "private_rt_AZA" {
  vpc_id = "${var.vpc_id}"
  tags {
      Name = "Privat_RT_AZA"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.NatGateway_AZA.id}"
  }
}

// Private ROute Table for AZB
resource "aws_route_table" "private_rt_AZB" {
  vpc_id = "${var.vpc_id}"
  tags {
      Name = "Privat_RT_AZB"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.NatGateway_AZB.id}"
  }
}

