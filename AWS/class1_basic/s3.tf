resource "aws_s3_bucket" "b" {
  bucket = "terraform_nadir35"
  acl    = "private"

  tags = {
    Name        = "Nadir35_s3"
    Environment = "Dev"
  }
}