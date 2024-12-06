module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = var.vpc_cidr
  public_cidr  = var.public_subnet_cidr
  private_cidr = var.private_subnet_cidr
  availability_zone = var.availability_zone
}

#create a s3 bucket

module "s3_bucket" {
  source     = "./modules/s3"
  bucket_name = var.bucket_name
  bucket_acl = var.bucket_acl
  environment = var.environment
  versioning_enabled = var.versioning_enabled
}


#create a ec2 instances

# Using the EC2 module to create an instance


module "ec2_instance" {
  source       = "./modules/ec2"
  ami_id       = var.ami_id
  instance_type = var.instance_type
  key_name     = var.key_name
}


#create a autoscaling

module "autoscaling" {
  source           = "./modules/atutoscaling"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  subnet_id        = var.subnet_id
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
}










