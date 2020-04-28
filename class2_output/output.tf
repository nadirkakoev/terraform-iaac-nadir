output "name" {
  value = "nadir"
}

              #won't work untill terraform apply

output "lastname" {
  value = "kakoev"
}

resource "aws_key_pair" "eu-west-2-key2" {
  key_name   = "nadir_mac_key2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"



output "keyname" {
  value = ""
}


}