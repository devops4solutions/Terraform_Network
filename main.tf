provider "aws" {
//alias="sandbox2"
region = "${var.region}"

assume_role {
    role_arn     = "arn:aws:iam::216698690714:role/Jenkins_CrossAccountRole"
    session_name = "Terraform_Automation"
    external_id  = "terraform"
  }

}

module "vpc" {

source = "./modules/vpc"
vpcflowlogsrole_arn="${module.iam.vpcflowlogsrole_arn}"
vpcfullcidr="${var.vpcfullcidr}"
}

module "iam" {

source = "./modules/iam"

}

module "network" {
source = "./modules/network"
vpc_id = "${module.vpc.vpc_id}"
public_subnet_id_AZA ="${module.subnet.public_subnet_id_AZA}"
private_subnet_id_db_AZA ="${module.subnet.private_subnet_id_db_AZA}"
//private_subnet_id_web_AZA ="${module.subnet.private_subnet_id_web_AZA}"
public_subnet_id_AZB ="${module.subnet.public_subnet_id_AZB}"
private_subnet_id_db_AZB ="${module.subnet.private_subnet_id_db_AZB}"
//private_subnet_id_web_AZB ="${module.subnet.private_subnet_id_web_AZB}"
    
    subnet_public_AzA ="${var.subnet_public_AzA}"
subnet_private_AzA ="${var.subnet_private_AzA}"
subnet_public_AzB ="${var.subnet_public_AzB}"
subnet_private_AzB ="${var.subnet_private_AzB}"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = "${module.vpc.vpc_id}"
}

module "subnet" {
source = "./modules/subnets"
  vpc_id = "${module.vpc.vpc_id}"
public_rt_id="${module.network.public_rt_id}"
private_rt_AZA_id="${module.network.private_rt_AZA_id}"
private_rt_AZB_id="${module.network.private_rt_AZB_id}"
subnet_public_AzA ="${var.subnet_public_AzA}"
subnet_private_AzA ="${var.subnet_private_AzA}"
subnet_public_AzB ="${var.subnet_public_AzB}"
subnet_private_AzB ="${var.subnet_private_AzB}"
az_b ="${var.az_b}"
az_a ="${var.az_a}"
    
    

}

terraform {

 backend "s3" {
 bucket = "terraform-remote-state-clouds-cydaptiv-s3-network"
 dynamodb_table = "terraform-state-lock-dynamo-network"
 region = "us-east-1"
 key = "terraform.tfstate"
 role_arn     = "arn:aws:iam::216698690714:role/Jenkins_CrossAccountRole"
 }
}
