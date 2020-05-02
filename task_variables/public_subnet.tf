resource "aws_subnet" "public1" {
  vpc_id                  = "${aws_vpc.nadir.id}"
  cidr_block              = "${var.public_cidr1}"
  //availability_zone       = "${var.region}${var.az1}"
  map_public_ip_on_launch = true                      //DHCP enabled or false=disabled,multiple component added ,public ip automatically
  tags                    = "${var.tags}"
}

resource "aws_subnet" "public2" {
  vpc_id                  = "${aws_vpc.nadir.id}"     # gets vpc id
  cidr_block              = "${var.public_cidr2}"     # gets user cidr block
  //availability_zone       = "${var.region}${var.az2}" # az (6)
  map_public_ip_on_launch = true                      //DHCP enabled or false=disabled,multiple component added
  tags                    = "${var.tags}"
}

resource "aws_subnet" "public3" {
  vpc_id                  = "${aws_vpc.nadir.id}"
  cidr_block              = "${var.public_cidr3}"
  //availability_zone       = "${var.region}${var.az3}"
  map_public_ip_on_launch = true                      //DHCP enabled or false=disabled,multiple component added
  tags                    = "${var.tags}"
}
