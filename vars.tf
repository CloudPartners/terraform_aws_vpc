variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "ap-southeast-2"
}

variable "environment_name" {
  description = "Name of the environment"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

variable "cost_centre" {
  description = "Cost Centre Construct"
}