variable "cidr" {
  description = "The CIDR block for the VPC"
}

variable "enable_dns_support" {
  description = "Boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Boolean flag to enable/disable DNS hostnames in the VPC"
  default     = false
}

variable "enable_nat_gateway" {
  description = "Boolean flag to enable/disable creation of a NAT gateway in the VPC, and associated routes"
  default     = true
}

variable "environment" {
  description = "General environment name - used in generated tag mappings and naming of resources"
}

variable "tags" {
  description = "Generic tag map to inject into resources in this module"
  default     = {}
}

variable "igw_tags" {
  description = "Generic tag map to inject into resources in this module"
  default     = {}
}

variable "nat_tags" {
  description = "Generic tag map to inject into resources in this module"
  default     = {}
}
