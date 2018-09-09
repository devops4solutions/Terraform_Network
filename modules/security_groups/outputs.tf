output "FrontEnd_SG_id"
{
    value = "${aws_security_group.FrontEnd_SG.id}"
}
output "BastionHost_SG_id"
{
    value = "${aws_security_group.BastionHost_SG.id}"

}

output "Database_SG_id"
{
    value = "${aws_security_group.Database_SG.id}"

}
output "ELB_SG_id"
{
    value = "${aws_security_group.ELB_SG.id}"

}
output "EFS_SG_id"
{
    value = "${aws_security_group.EFS_SG.id}"

}

