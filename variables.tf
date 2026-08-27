variable "aws_region" {
  description = "AWS Region where the demo infrastructure will be created."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used when naming and tagging resources."
  type        = string
  default     = "terraform-launchpad"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "project_name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment label used in names, tags, and the demo webpage."
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type used for the web server."
  type        = string
  default     = "t3.micro"
}

variable "vpc_cidr" {
  description = "CIDR range for the demo VPC."
  type        = string
  default     = "10.42.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet."
  type        = string
  default     = "10.42.1.0/24"
}
