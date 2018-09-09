
// These outputs are used for refferingthese attributes using remote state.
//Only the root level outputs from the remote state are accessible. Outputs from modules within the state cannot be accessed. 
//If you want a module output to be accessible via a remote state, you must thread the output through to a root output.
// VPC outputs
output "vpc_id_root" {
  value = "${module.vpc.vpc_id}"
}

//subnets outputs
output "public_subnet_id_AZA_root" {
 value = "${module.subnet.public_subnet_id_AZA}"
}

output "private_subnet_id_db_AZA_root" {
 value = "${module.subnet.private_subnet_id_db_AZA}"
}

/*output "private_subnet_id_web_AZA_root" {
 value = "${module.subnet.private_subnet_id_web_AZA}"
}*/

output "public_subnet_id_AZB_root" {
 value = "${module.subnet.public_subnet_id_AZB}"
}

output "private_subnet_id_db_AZB_root" {
 value = "${module.subnet.private_subnet_id_db_AZB}"
}

/*output "private_subnet_id_web_AZB_root" {
 value = "${module.subnet.private_subnet_id_web_AZB}"
}*/



// route table outputs

output "public_rt_id_root" {
  value = "${module.network.public_rt_id}"
}

output "private_rt_AZA_id_root" {
  value = "${module.network.private_rt_AZA_id}"
}
output "private_rt_AZB_id_root" {
  value = "${module.network.private_rt_AZB_id}"
}

// security groups outputs

output "FrontEnd_SG_id_root"
{
    value = "${module.security_groups.FrontEnd_SG_id}"
}

output "Database_SG_id_root"
{
    value = "${module.security_groups.Database_SG_id}"

}

output "ELB_SG_id_root"
{
    value = "${module.security_groups.ELB_SG_id}"

}
output "EFS_SG_id_root"
{
    value = "${module.security_groups.EFS_SG_id}"

}

output "BastionHost_SG_id_root"
{
    value = "${module.security_groups.BastionHost_SG_id}"

}

