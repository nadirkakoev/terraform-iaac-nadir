resource "aws_subnet" "private1" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.private_subnet1}"
}

resource "aws_subnet" "private2" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.private_subnet2}"
}

resource "aws_subnet" "private3" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.private_subnet3}"
}
