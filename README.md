# Guidelines

This Terraform module provides a slightly opinionated AWS VPC implementation that can be invoked as follows:

```
module "vpc" {
  source               = "github.com/CloudPartners/terraform_aws_vpc"
  cidr                 = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  environment          = "${var.environment}"

  tags {
    CostCentre  = "${var.environment}"
    Environment = "${var.environment}"
  }
}
```

The opinionated bit is in reference to the subnets / cidr blocks that are created.  The following table shows the assumed conventions, based on the CIDR block specified for the VPC.  The AZ alternates between the first two AZs in the Region defined by the AWS provider in the calling template.

| Subnet        | Type        | AZ | CIDR                         |
| ------------- | ----------- | -- | ---------------------------- |
| Public 1      | PUBLIC      |  0 | cidrsubnet(var.cidr, 8, 0)   |
| Public 2      | PUBLIC      |  1 | cidrsubnet(var.cidr, 8, 100) |
| Web 1         | PRIVATE     |  0 | cidrsubnet(var.cidr, 8, 10)  |
| Web 2         | PRIVATE     |  1 | cidrsubnet(var.cidr, 8, 110) |
| Services 1    | PRIVATE     |  0 | cidrsubnet(var.cidr, 8, 20)  |
| Services 2    | PRIVATE     |  1 | cidrsubnet(var.cidr, 8, 120) |
| Cache 1       | PRIVATE     |  0 | cidrsubnet(var.cidr, 8, 30)  |
| Cache 2       | PRIVATE     |  1 | cidrsubnet(var.cidr, 8, 130) |
| Data 1        | PRIVATE     |  0 | cidrsubnet(var.cidr, 8, 40)  |
| Data 2        | PRIVATE     |  1 | cidrsubnet(var.cidr, 8, 140) |

# Variables

The following variables can be specified:

| Variable               | Description                                                                       | Required | Default |
| ---------------------- | --------------------------------------------------------------------------------- | :------: | ------- |
| `cidr`                 | The CIDR block for the VPC                                                        | Y        | -       |
| `enable_dns_support`   | Boolean flag to enable/disable DNS support in the VPC                             | N        | true    |
| `enable_dns_hostnames` | Boolean flag to enable/disable DNS hostnames in the VPC                           | N        | false   |
| `environment`          | General environment name - used in generated tag mappings and naming of resources | Y        | -       |
| `tags`                 | Generic tag map to inject into resources in this module                           | N        | {}      |
