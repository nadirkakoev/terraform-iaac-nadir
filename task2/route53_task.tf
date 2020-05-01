resource "aws_route53_record" "elina" {
  zone_id = "Z02917502SOB5R24QHEPG"
  name    = "elina.kakoev.com"
  type    = "A"
  ttl     = "10"
  records = ["${aws_instance.task2.public_ip}"] //  ,[] for multiple
}
