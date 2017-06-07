variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

variable "environment" {
  description = "General name of the environment - used in generated tag mappings for naming of resources"
}

variable "tags" {
  description = "Generic tag map to inject into resources in this module"
  default     = {}
}
