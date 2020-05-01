resource "aws_vpc" "nadir" {
  cidr_block = "${var.vpc_cidr}"
  tags      =   "${var.tags}"
}


resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public1.id}"
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.nadir.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}
