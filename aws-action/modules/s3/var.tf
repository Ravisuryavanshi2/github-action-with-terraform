variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "bucket_acl" {
  description = "ACL for the S3 bucket"
  default     = "private"
}

variable "environment" {
  description = "Environment tag"
  default     = "production"
}

variable "versioning_enabled" {
  description = "Enable versioning"
  default     = true
}
