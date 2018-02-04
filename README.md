# Guidelines

This Terraform module provides a slightly opinionated AWS VPC implementation that can be invoked as follows:

```
module "vpc" {
  source               = "github.com/CloudPartners/terraform_aws_vpc"
  cidr                 = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  environment          = "${var.environment}"

  tags {
    CostCentre  = "VPC"
    Environment = "${var.environment}"
  }

  igw_tags {
    CostCentre  = "IGW"
    Environment = "${var.environment}"
  }  
}
```

The opinionated bit is in reference to the subnets / cidr blocks that are created.  The following table shows the assumed conventions, based on the CIDR block specified for the VPC.  The AZ alternates between the first two AZs in the Region defined by the AWS provider in the calling template.  Public subnets are set to auto-assign Public IP addresses.

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

# Inputs

The following input variables can be specified:

| Variable               | Description                                                                       | Required | Default |
| ---------------------- | --------------------------------------------------------------------------------- | :------: | ------- |
| `cidr`                 | The CIDR block for the VPC                                                        | Y        | -       |
| `enable_dns_support`   | Boolean flag to enable/disable DNS support in the VPC                             | N        | true    |
| `enable_dns_hostnames` | Boolean flag to enable/disable DNS hostnames in the VPC                           | N        | false   |
| `environment`          | General environment name - used in generated tag mappings and naming of resources | Y        | -       |
| `tags`                 | Generic tag map to inject into resources in this module                           | N        | {}      |
| `igw_tags`             | Generic tag map to inject into IGW resources in this module                       | N        | {}      |

# Outputs

The following output variables are provided:

| Variable                      | Description                                                                       |
| ----------------------------- | --------------------------------------------------------------------------------- |
| `vpc_id`                      | The ID of the new AWS VPC                                                         |
| `public_subnet_ids`           | List of 'Public x' subnet IDs (see above)                                         |
| `public_subnet_cidr_blocks`   | List of 'Public x' subnet CIDR blocks (see above)                                 |
| `public_subnet_azs`           | List of 'Public x' subnet AZs (see above)                                         |
| `web_subnet_ids`              | List of 'Web x' subnet IDs (see above)                                            |
| `web_subnet_cidr_blocks`      | List of 'Web x' subnet CIDR blocks (see above)                                    |
| `web_subnet_azs`              | List of 'Web x' subnet AZs (see above)                                            |
| `services_subnet_ids`         | List of 'Services x' subnet IDs (see above)                                       |
| `services_subnet_cidr_blocks` | List of 'Services x' subnet CIDR blocks (see above)                               |
| `services_subnet_azs`         | List of 'Services x' subnet AZs (see above)                                       |
| `cache_subnet_ids`            | List of 'Cache x' subnet IDs (see above)                                          |
| `cache_subnet_cidr_blocks`    | List of 'Cache x' subnet CIDR blocks (see above)                                  |
| `cache_subnet_azs`            | List of 'Cache x' subnet AZs (see above)                                          |
| `data_subnet_ids`             | List of 'Data x' subnet IDs (see above)                                           |
| `data_subnet_cidr_blocks`     | List of 'Data x' subnet CIDR blocks (see above)                                   |
| `data_subnet_azs`             | List of 'Data x' subnet AZs (see above)                                           |
