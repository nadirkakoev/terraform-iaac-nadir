output "vpc" {
  value = "${aws_vpc.nadir.id}"                       // * to specify all if you want to put before publi_ip
}
