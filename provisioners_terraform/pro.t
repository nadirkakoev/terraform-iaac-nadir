provisioner "remote-exec" {
  connection {
    type = "ssh"
    user = "centos"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = "${self.public_ip}"
     }


   inline = [
       "echo Hello" 

    ]
}
