
module "ec2" {
  source = "./ec2module"
  ec2_tags_public =  {
    Name        = "Grp4s_ec2_public"
    Environment = "Dev"
    type="public"
  }
  ec2_tags_private={
    Name        = "Grp4s_ec2_private"
    Environment = "Dev"
    type="private"
  }
  vpc_id               = module.vpc.vpc_id
  vpc_public_subnet_id = module.vpc.vpc_subnet_public_id
  vpc_private_subnet_id = module.vpc.vpc_subnet_private_id
}

terraform {
  backend "s3" {
    bucket = "group-4-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table="state-locking-table"
    # assume_role = {
    #   role_arn = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:role/Terraform"
    # }
  }
}

module "vpc" {
  source = "./vpcmodule"
  vpc_tags = {
    Name        = "Grp4s_vpc"
    Environment = "Dev"
  }
}