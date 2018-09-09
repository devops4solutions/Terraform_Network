variable vpc_id {}
variable public_rt_id {}
variable private_rt_AZA_id {}
variable private_rt_AZB_id {}
variable subnet_private_AzB {}
variable subnet_public_AzB {}
variable subnet_private_AzA {}
variable subnet_public_AzA {}
variable az_b {}
variable az_a {}


// public subnet on AZ - A
resource "aws_subnet" "PublicAZA" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_public_AzA}"
  availability_zone = "${var.az_a}"
  tags {
        Name = "PublicSubnetAZA"
  }
 
}


resource "aws_route_table_association" "PublicRouteTableAZA" {
    subnet_id = "${aws_subnet.PublicAZA.id}"
    route_table_id = "${var.public_rt_id}"
}

// public subnet on AZ -B
resource "aws_subnet" "PublicAZB" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_public_AzB}"
  availability_zone = "${var.az_b}"
  tags {
        Name = "PublicSubnetAZB"
  }

}


resource "aws_route_table_association" "PublicRouteTableAZB" {
    subnet_id = "${aws_subnet.PublicAZB.id}"
    route_table_id = "${var.public_rt_id}"
}



// Private Subnet for AZ-A for DB

resource "aws_subnet" "PrivateAZA_DB" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_private_AzA}"
  availability_zone = "${var.az_a}"
  tags {
        Name = "PrivateSubnetAZA_DB"
  }
}

resource "aws_route_table_association" "PrivateRouteTableAZA_DB" {
    subnet_id = "${aws_subnet.PrivateAZA_DB.id}"
    route_table_id = "${var.private_rt_AZA_id}"

}

// Private Subnet for AZ- B for DB
resource "aws_subnet" "PrivateAZB_DB" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_private_AzB}"
  availability_zone = "${var.az_b}"
  tags {
        Name = "PrivateSubnetAZB_DB"
  }
}

resource "aws_route_table_association" "PrivateRouteTableAZB_DB" {
    subnet_id = "${aws_subnet.PrivateAZB_DB.id}"
    route_table_id = "${var.private_rt_AZB_id}"

}
  
  
  // ************ COmmented ****************
  
// Private Subnet for AZ-A for webservers

/*resource "aws_subnet" "PrivateAZA" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_private_AzA}"
  availability_zone = "${var.az_a}"
  tags {
        Name = "PrivateSubnetAZA"
  }
}

resource "aws_route_table_association" "PrivateRouteTableAZA" {
    subnet_id = "${aws_subnet.PrivateAZA.id}"
    route_table_id = "${var.private_rt_AZA_id}"

}*/

// Private Subnet for AZ- B for webservers
/*resource "aws_subnet" "PrivateAZB" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_private_AzB}"
  availability_zone = "${var.az_b}"
  tags {
        Name = "PrivateSubnetAZB"
  }
}

resource "aws_route_table_association" "PrivateRouteTableAZB" {
    subnet_id = "${aws_subnet.PrivateAZB.id}"
    route_table_id = "${var.private_rt_AZB_id}"

}

*/ 

