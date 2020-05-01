output "vpc" {
  value = "${aws_vpc.nadir.id}" // * to specify all if you want to put before publi_ip
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

output "instance_task_2" {
  value = "${aws_instance.task_2.id}"