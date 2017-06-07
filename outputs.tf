output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "public_subnet_ids" {
  value = ["${aws_subnet.subnet_public_1.id}", "${aws_subnet.subnet_public_2.id}"]
}

output "web_subnet_ids" {
  value = ["${aws_subnet.subnet_web_1.id}", "${aws_subnet.subnet_web_2.id}"]
}

output "services_subnet_ids" {
  value = ["${aws_subnet.subnet_services_1.id}", "${aws_subnet.subnet_services_2.id}"]
}

output "cache_subnet_ids" {
  value = ["${aws_subnet.subnet_cache_1.id}", "${aws_subnet.subnet_cache_2.id}"]
}

output "data_subnet_ids" {
  value = ["${aws_subnet.subnet_data_1.id}", "${aws_subnet.subnet_data_2.id}"]
}
