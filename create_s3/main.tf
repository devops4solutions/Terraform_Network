provider "aws" {
region = "${var.region}"

assume_role {
    role_arn     = "arn:aws:iam::216698690714:role/Jenkins_CrossAccountRole"
    session_name = "Terraform_Automation"
    external_id  = "terraform"
  }

}

# terraform state file setup
# create an S3 bucket for vpc to store the state file in

resource "aws_s3_bucket" "terraform-state-storage-s3-network" {
   bucket = "${var.bucket_network}"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "S3 Remote Terraform State Store for Network"
    }      
}

resource "aws_s3_bucket" "terraform-cydaptiv-s3-openemr-elb-log" {
   bucket = "${var.bucket_elb}"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "terraform-cydaptiv-s3-openemr-elb-log"
    }      
}

resource "aws_s3_bucket" "terraform-state-storage-s3-webserver" {
   bucket = "${var.bucket_webserver}"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "S3 Remote Terraform State Store for Webserver"
    }
}

resource "aws_s3_bucket" "terraform-state-storage-s3-database" {
   bucket = "${var.bucket_database}"

    versioning {
      enabled = true
    }

    lifecycle {
      prevent_destroy = true
    }

    tags {
      Name = "S3 Remote Terraform State Store for Database"
    }
}


# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock-network" {
  name = "terraform-state-lock-dynamo-network"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags {
    Name = "DynamoDB Terraform State Lock Table for Network"
  }
}


resource "aws_dynamodb_table" "dynamodb-terraform-state-lock-webserver" {
  name = "terraform-state-lock-dynamo-webserver"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB Terraform State Lock Table for webserver"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock-database" {
  name = "terraform-state-lock-dynamo-database"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB Terraform State Lock Table for Database"
  }
}
