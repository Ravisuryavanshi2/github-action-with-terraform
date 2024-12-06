variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_cidr" {
  description = "CIDR block for the public subnet"
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
}

variable "availability_zone" {
  description = "Availability zone for subnets"
}
