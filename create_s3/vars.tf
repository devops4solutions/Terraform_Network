variable "region" {
  default = "us-east-1"
}
variable "bucket_database"
{
  default="terraform-remote-state-clouds-cydaptiv-s3-database"
  }
variable "bucket_elb"
{
  default="terraform-clouds-cydaptiv-s3-openemr-elb-log"
  }
variable "bucket_webserver"
{
  default="terraform-remote-state-clouds-cydaptiv-s3-webserver"
  }
variable "bucket_network"
{
  default="terraform-remote-state-clouds-cydaptiv-s3-network"
  }
