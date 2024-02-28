
module "ec2" {
  source = "./ec2module"
  ec2_tags = {
    Name        = "Grp4s_ec2"
    Environment = "Dev"
  }
  vpc_id               = module.vpc.vpc_id
  vpc_public_subnet_id = module.vpc.vpc_subnet_public_id
}

terraform {
  backend "s3" {
    bucket = "group-4-bucket"
    key    = "tfstate"
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