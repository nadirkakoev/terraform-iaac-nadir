output "vpc" {
  value = "${aws_vpc.nadir.id}"                       // * to specify all if you want to put before publi_ip
}

output "public_subnets" {
  value = [
    "${aws_subnet.public1.id}",
    "${aws_subnet.public2.id}",
    "${aws_subnet.public3.id}"
    ]
}



output "private_subnets" {
  value = [
    "${aws_subnet.private1.id}",
    "${aws_subnet.private2.id}",
    "${aws_subnet.private3.id}"
    ]
}
