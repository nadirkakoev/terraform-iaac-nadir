resource "aws_route53_record" "nagios" {
  zone_id = "Z02917502SOB5R24QHEPG"
  name    = "nagios.kakoev.com"
  type    = "A"
  ttl     = "10"
  records = ["${aws_instance.nagios.public_ip}"] //  ,[] for multiple
}
