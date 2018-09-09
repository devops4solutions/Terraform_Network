output "public_subnet_id_AZA" {
 value = "${aws_subnet.PublicAZA.id}"
}

output "private_subnet_id_db_AZA" {
 value = "${aws_subnet.PrivateAZA_DB.id}"
}

/*output "private_subnet_id_web_AZA" {
 value = "${aws_subnet.PrivateAZA.id}"
}
*/
output "public_subnet_id_AZB" {
 value = "${aws_subnet.PublicAZB.id}"
}

output "private_subnet_id_db_AZB" {
 value = "${aws_subnet.PrivateAZB_DB.id}"
}

/*output "private_subnet_id_web_AZB" {
 value = "${aws_subnet.PrivateAZB.id}"
}
*/
