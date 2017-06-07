variable "cidr" {
  description = "The CIDR block for the VPC"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = false
}

variable "environment" {
  description = "General environment name - used in generated tag mappings and naming of resources"
}

variable "tags" {
  description = "Generic tag map to inject into resources in this module"
  default     = {}
}
