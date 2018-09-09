output "public_rt_id" {
  value = "${aws_route_table.public_rt.id}"
}
output "private_rt_AZA_id" {
  value = "${aws_route_table.private_rt_AZA.id}"
}

output "private_rt_AZB_id" {
  value = "${aws_route_table.private_rt_AZB.id}"
}

