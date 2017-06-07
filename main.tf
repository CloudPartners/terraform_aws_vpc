data "aws_availability_zones" "availability_zones" {}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment_name}"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name         = "${var.aws_region}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags {
    Name        = "${var.environment_name}"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_vpc_dhcp_options_association" "vpc_dhcp_options_association" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.vpc_dhcp_options.id}"
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment_name}"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 8, 0)}"
  availability_zone       = "${data.aws_availability_zones.availability_zones.names[0]}"
  map_public_ip_on_launch = true

  tags {
    Name        = "${var.environment_name}-PUBLIC-1"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 8, 100)}"
  availability_zone       = "${data.aws_availability_zones.availability_zones.names[1]}"
  map_public_ip_on_launch = true

  tags {
    Name        = "${var.environment_name}-PUBLIC-2"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_web_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 10)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"

  tags {
    Name        = "${var.environment_name}-WEB-1"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_web_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 110)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"

  tags {
    Name        = "${var.environment_name}-WEB-2"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_services_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 20)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"

  tags {
    Name        = "${var.environment_name}-SERVICES-1"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_services_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 120)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"

  tags {
    Name        = "${var.environment_name}-SERVICES-2"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_cache_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 30)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"

  tags {
    Name        = "${var.environment_name}-CACHE-1"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_cache_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 130)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"

  tags {
    Name        = "${var.environment_name}-CACHE-2"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_data_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 40)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[0]}"

  tags {
    Name        = "${var.environment_name}-DATA-1"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "subnet_data_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(var.vpc_cidr, 8, 140)}"
  availability_zone = "${data.aws_availability_zones.availability_zones.names[1]}"

  tags {
    Name        = "${var.environment_name}-DATA-2"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_default_network_acl" "default_network_acl" {
  default_network_acl_id = "${aws_vpc.vpc.default_network_acl_id}"
  subnet_ids             = ["${aws_subnet.subnet_public_1.id}", "${aws_subnet.subnet_public_2.id}", "${aws_subnet.subnet_web_1.id}", "${aws_subnet.subnet_web_2.id}", "${aws_subnet.subnet_services_1.id}", "${aws_subnet.subnet_services_2.id}", "${aws_subnet.subnet_cache_1.id}", "${aws_subnet.subnet_cache_2.id}", "${aws_subnet.subnet_data_1.id}", "${aws_subnet.subnet_data_2.id}"]

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags {
    Name        = "${var.environment_name}"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_eip" "eip_nat" {
  vpc = true
}

resource "aws_default_route_table" "route_table_private" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"

  tags {
    Name        = "${var.environment_name}-Private"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment_name}-Public"
    CostCentre  = "${var.cost_centre}"
    Environment = "${var.environment_name}"
  }
}

resource "aws_route_table_association" "route_table_association_public_1" {
  subnet_id      = "${aws_subnet.subnet_public_1.id}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

resource "aws_route_table_association" "route_table_association_public_2" {
  subnet_id      = "${aws_subnet.subnet_public_2.id}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

resource "aws_route" "route_internet_gateway" {
  route_table_id         = "${aws_route_table.route_table_public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet_gateway.id}"
}

# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = "${aws_eip.eip_nat.id}"
#   subnet_id     = "${aws_subnet.subnet_public_1.id}"
#   depends_on    = ["aws_internet_gateway.internet_gateway"]
# }


# resource "aws_route" "route_nat_gateway" {
#   route_table_id         = "${aws_vpc.vpc.default_route_table_id}"
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = "${aws_nat_gateway.nat_gateway.id}"
# }
