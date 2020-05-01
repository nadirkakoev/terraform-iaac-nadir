resource "aws_subnet" "public1" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.public_subnet1}"
}

resource "aws_subnet" "public2" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.public_subnet1}"
}

resource "aws_subnet" "public3" {
  vpc_id     = "${aws_vpc.nadir.id}"
  cidr_block = "${var.public_subnet1}"
}
