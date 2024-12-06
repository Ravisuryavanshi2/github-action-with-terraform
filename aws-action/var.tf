variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The availability zone to deploy subnets"
  default     = "ap-northeast-3a"
}


# create a s3 bucket 

variable "bucket_name" {
  description = "The name of the S3 bucket"
  default     = "hello-s3-bucket-210001"
}

variable "bucket_acl" {
  description = "The access control list (ACL) for the bucket"
  default     = "private"
}


variable "environment" {
  description = "Environment tag"
  default     = "production"
}


variable "versioning_enabled" {
  description = "Enable S3 versioning"
  default     = true
}

#create a ec2 instances

variable "ami_id" {
  description = "AMI ID for the instance"
  default     = "ami-0b40dea19b4538863" 
  type = string
}


variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
  type = string
}


variable "key_name" {
  description = "Name of the key pair to access EC2"
  default     = "hello"
  type = string

}

#create a autoscaling

variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
  default     = "ami-0b40dea19b4538863"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
  default     = "hello"
}

variable "subnet_id" {
  description = "Subnet ID for Auto Scaling Group"
  type        = string
  default     = "subnet-0f389d6da1d072973"
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group"
  type        = number
  default     = 3
}





