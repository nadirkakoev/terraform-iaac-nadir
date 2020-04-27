resource "aws_route53_record" "www" {
  zone_id = "Z02917502SOB5R24QHEPG"
  name    = "www.kakoev.com"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.web.public_ip}"]
}