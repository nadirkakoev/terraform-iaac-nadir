resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  count      = 3
  vpc_id     = "${aws_vpc.main.id}" #interpolating id from vpc
  cidr_block = "10.0.${count.index +1}.0/24"                    #loop  123
}
