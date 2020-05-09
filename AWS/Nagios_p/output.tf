output "vpc" {
  value = "${aws_vpc.nagios.id}" // * to specify all if you want to put before publi_ip
}

output "private_subnets" {
  value = [
    "${aws_subnet.private1.id}     ${aws_subnet.private1.cidr_block}     ${aws_subnet.private1.availability_zone}",
    "${aws_subnet.private2.id}     ${aws_subnet.private2.cidr_block}     ${aws_subnet.private2.availability_zone}",
    "${aws_subnet.private3.id}      ${aws_subnet.private3.cidr_block}     ${aws_subnet.private3.availability_zone}",
  ]
}

output "public_subnets" {
  value = [
    "${aws_subnet.public1.id}     ${aws_subnet.public1.cidr_block}     ${aws_subnet.public1.availability_zone}",
    "${aws_subnet.public2.id}     ${aws_subnet.public2.cidr_block}     ${aws_subnet.public2.availability_zone}",
    "${aws_subnet.public3.id}      ${aws_subnet.public3.cidr_block}     ${aws_subnet.public3.availability_zone}",
  ]
}

output "nagios_ID" {
  value = "${aws_instance.nagios.id}"
}

output "nagios_ARN" {
  value = "${aws_instance.nagios.arn}"
}

output "nagios_IP" {
  value = "${aws_instance.nagios.public_ip}"
}

# output "nagios_DNS" {
#   value = "${aws_instance.nagios.public_dns}"
# }

# output "internet_gateway_id" {
#   value = "${aws_internet_gateway.gw.id}"
# }


