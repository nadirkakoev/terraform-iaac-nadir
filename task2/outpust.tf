output "public_ip" {
  value = "${aws_instance..public_ip}"     // * to specify all if you want to put before publi_ip
}
