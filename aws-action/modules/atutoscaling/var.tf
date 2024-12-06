variable "ami_id" {
  description = "The AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instances"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of instances in the autoscaling group"
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances in the autoscaling group"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the autoscaling group"
  type        = number
}
