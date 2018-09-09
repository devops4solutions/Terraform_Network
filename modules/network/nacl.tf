
variable subnet_private_AzB {}
variable subnet_public_AzB {}
variable subnet_private_AzA {}
variable subnet_public_AzA {}
resource "aws_network_acl" "nacl_public" {
   vpc_id = "${var.vpc_id}"
    subnet_ids = ["${var.public_subnet_id_AZA}","${var.public_subnet_id_AZB}"]


//	Allows outbound HTTPS traffic from the subnet to the Internet.
 egress {
        rule_no = 110
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        protocol="tcp"
        from_port = 443
        to_port = 443
    }

//Allows outbound HTTP traffic from the subnet to the Internet.
egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =100
        action="allow"
  }

// Allows outbound MY SQL access to database servers in the private subnet. CIDR block of DB private subnet
egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_block = "${var.subnet_private_AzA}"
        rule_no =120
        action="allow"
  }

egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_block = "${var.subnet_private_AzB}"
        rule_no =130
        action="allow"
  }

//Allows outbound responses to clients on the Internet (for example, serving web pages to people visiting the web servers in the subnet).
egress {
        from_port = 32768
        to_port = 65535
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =140
        action="allow"
  }
// Allows outbound SSH access to instances in your private subnet (from an SSH bastion, if you have one).
egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =150
        action="allow"
  }


   
      ingress {
        rule_no = 110
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        protocol="tcp"        
        from_port = 443
        to_port = 443
    }

ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =90
        action="allow"
  }

ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =100
        action="allow"
  }

ingress {
        from_port = 1024
        to_port = 65535
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =140
        action="allow"
  }


   tags {
        Name = "nacl_public"
    }
}

resource "aws_network_acl" "nacl_private" {
   vpc_id = "${var.vpc_id}"
    subnet_ids = ["${var.private_subnet_id_db_AZA}","${var.private_subnet_id_db_AZB}"]
     

 egress {
        rule_no = 21
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        protocol="tcp"
        from_port = 443
        to_port = 443
    }

egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =11
        action="allow"
  }
// Allows outbound responses to the public subnet
egress {
        from_port = 32768
        to_port = 65535
        protocol = "tcp"
        cidr_block = "${var.subnet_public_AzA}"
        rule_no =13
        action="allow"
  }
egress {
        from_port = 32768
        to_port = 65535
        protocol = "tcp"
        cidr_block = "${var.subnet_public_AzA}"
        rule_no =16
        action="allow"
  }
egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =25
        action="allow"
  }
egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        rule_no =19
        action="allow"
  }

//Allows inbound return traffic from the NAT device in the public subnet for requests originating in the private subnet.
      ingress {
        rule_no = 21
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        protocol="tcp"
        from_port = 1024
        to_port = 65535
    }

//Allows inbound RDP traffic from the Microsoft Terminal Services gateway in the public subnet.
ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_block = "${var.subnet_private_AzB}"
        rule_no =13
        action="allow"
}

ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_block = "${var.subnet_private_AzA}"
        rule_no =14
        action="allow"
}

ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_block = "${var.subnet_private_AzB}"
        rule_no =17
        action="allow"
}

ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_block = "${var.subnet_private_AzA}"
        rule_no =18
        action="allow"
}


    tags {
        Name = "nacl_private"
    }
}

