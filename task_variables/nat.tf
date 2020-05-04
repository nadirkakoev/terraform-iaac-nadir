resource "aws_eip" "nadir_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nadir_nat" {
  allocation_id = "${aws_eip.nadir_eip.id}"
  subnet_id     = "${aws_subnet.public1.id}"
  depends_on    = ["aws_internet_gateway.gw"]
  tags          = "${var.tags}"
}

# Terraform  VPC for NAT
resource "aws_route_table" "nadir_nat" {
  vpc_id = "${aws_vpc.nadir.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nadir_nat.id}"
  }
}

# Terraform  private routes
resource "aws_route_table_association" "1r" {
  subnet_id      = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.nadir_nat.id}"
}

resource "aws_route_table_association" "2r" {
  subnet_id      = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.nadir_nat.id}"
}

resource "aws_route_table_association" "3r" {
  subnet_id      = "${aws_subnet.private3.id}"
  route_table_id = "${aws_route_table.nadir_nat.id}"
}
