resource "aws_vpc" "nadir" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private" {
  count      = 3
  vpc_id     = "${aws_vpc.nadir.id}"         #interpolating id from vpc
  cidr_block = "10.0.${count.index +1}.0/24" #loop  123
}

resource "aws_subnet" "public" {
  count      = 3
  vpc_id     = "${aws_vpc.nadir.id}"           #interpolating id from vpc
  cidr_block = "10.0.10${count.index +1}.0/24" #loop  101.2.3
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.nadir.id}"
}

# resource "aws_nat_gateway" "gw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${aws_subnet.public.id}"
# }

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.nadir.id}"

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}
