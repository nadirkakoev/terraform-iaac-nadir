resource "aws_subnet" "private1" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.private_cidr1}"
}

resource "aws_subnet" "private2" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.private_cidr2}"
}

resource "aws_subnet" "private3" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.private_cidr3}"
}
