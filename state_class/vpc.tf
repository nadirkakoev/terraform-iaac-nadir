resource "aws_vpc" "nadir" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private" {
  count      = 3
  vpc_id     = "${aws_vpc.nadir.id}"                 #interpolating id from vpc
  cidr_block = "10.0.${count.index +1}.0/24"                    #loop  123
}



resource "aws_subnet" "public" {
  count      = 3
  vpc_id     = "${aws_vpc.nadir.id}"            #interpolating id from vpc
  cidr_block = "10.0.10${count.index +1}.0/24"                    #loop  101.2.3
}
