variable vpc_id {}

resource "aws_security_group" "BastionHost_SG" {
  tags {
        Name = "BastionHost_SG"
  }
  description ="BastionHost_SG"
  vpc_id = "${var.vpc_id}"

  ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_security_group" "ELB_SG" {
  tags {
        Name = "ELB_SG"
  }
  description ="ELB SG"
  vpc_id = "${var.vpc_id}"

  ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "EFS_SG" {
  tags {
        Name = "EFS_SG"
  }
  description ="EFS SG"
  vpc_id = "${var.vpc_id}"

  ingress {
        from_port = 2049
        to_port = 2049
        protocol = "TCP"
        security_groups = ["${aws_security_group.FrontEnd_SG.id}"]

  }
 
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_security_group" "FrontEnd_SG" {
  tags {
        Name = "FrontEnd_SG"
  }
  description = "Front END SG"
  vpc_id = "${var.vpc_id}"

  ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        security_groups=["${aws_security_group.ELB_SG.id}"]
  }
 /*ingress {
        from_port = 8080
        to_port = 8080
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }*/

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "Database_SG" {
  
  tags {
        Name = "Database_SG"
  }
  description = "Database SG"
     vpc_id = "${var.vpc_id}"


  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "TCP"
      security_groups = ["${aws_security_group.FrontEnd_SG.id}"]
  }
  ingress {
      from_port   = "22"
      to_port     = "22"
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

