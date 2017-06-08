output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_ids" {
  value = ["${aws_subnet.subnet_public_1.id}", "${aws_subnet.subnet_public_2.id}"]
}

output "public_subnet_cidr_blocks" {
  value = ["${aws_subnet.subnet_public_1.cidr_block}", "${aws_subnet.subnet_public_2.cidr_block}"]
}

output "public_subnet_azs" {
  value = ["${aws_subnet.subnet_public_1.availability_zone}", "${aws_subnet.subnet_public_2.availability_zone}"]
}

output "web_subnet_ids" {
  value = ["${aws_subnet.subnet_web_1.id}", "${aws_subnet.subnet_web_2.id}"]
}

output "web_subnet_cidr_blocks" {
  value = ["${aws_subnet.subnet_web_1.cidr_block}", "${aws_subnet.subnet_web_2.cidr_block}"]
}

output "web_subnet_azs" {
  value = ["${aws_subnet.subnet_web_1.availability_zone}", "${aws_subnet.subnet_web_2.availability_zone}"]
}

output "services_subnet_ids" {
  value = ["${aws_subnet.subnet_services_1.id}", "${aws_subnet.subnet_services_2.id}"]
}

output "services_subnet_cidr_blocks" {
  value = ["${aws_subnet.subnet_services_1.cidr_block}", "${aws_subnet.subnet_services_2.cidr_block}"]
}

output "services_subnet_azs" {
  value = ["${aws_subnet.subnet_services_1.availability_zone}", "${aws_subnet.subnet_services_2.availability_zone}"]
}

output "cache_subnet_ids" {
  value = ["${aws_subnet.subnet_cache_1.id}", "${aws_subnet.subnet_cache_2.id}"]
}

output "cache_subnet_cidr_blocks" {
  value = ["${aws_subnet.subnet_cache_1.cidr_block}", "${aws_subnet.subnet_cache_2.cidr_block}"]
}

output "cache_subnet_azs" {
  value = ["${aws_subnet.subnet_cache_1.availability_zone}", "${aws_subnet.subnet_cache_2.availability_zone}"]
}

output "data_subnet_ids" {
  value = ["${aws_subnet.subnet_data_1.id}", "${aws_subnet.subnet_data_2.id}"]
}

output "data_subnet_cidr_blocks" {
  value = ["${aws_subnet.subnet_data_1.cidr_block}", "${aws_subnet.subnet_data_2.cidr_block}"]
}

output "data_subnet_azs" {
  value = ["${aws_subnet.subnet_data_1.availability_zone}", "${aws_subnet.subnet_data_2.availability_zone}"]
}
