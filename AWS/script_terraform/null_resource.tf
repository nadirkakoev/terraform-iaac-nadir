resource "null_resource" "commands_to_run" {
  provisioner "remote-exec" {
    connection {
        type            = "ssh"
        user            = "centos"
        private_key     = "${file("~/.ssh/id_rsa")}"
        host            = "${aws_instance.centos.public_ip}"
    }
    inline = [
      "sudo yum install -y epel-release",
      "sudo yum install telnet -y",
      "sudo yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python-devel python-pip python-docker-py vim-enhanced ",
      "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
      "sudo yum install  docker-ce -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo pip uninstall docker docker-py docker-compose",
      "sudo pip install docker-compose==1.9",
    ]
  }
#   provisioner "file" {
#     connection {
#         type            = "ssh"
#         user            = "centos"
#         private_key     = "${file("~/.ssh/id_rsa")}"
#         host            = "${aws_instance.centos.public_ip}"
#     }
#     source      = "r1soft.repo"
#     destination = "/etc/yum.repos/d"
#   }
#   provisioner "remote-exec" {
#     connection {
#         type            = "ssh"
#         user            = "centos"
#         private_key     = "${file("~/.ssh/id_rsa")}"
#         host            = "${aws_instance.centos.public_ip}"
#     }
#     scripts = ["${file("wordpress.sh")}"]
#   }
# }





# resource "aws_instance" "cluster" {
#   count = 3

#   # ...
# }

# resource "null_resource" "cluster" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     cluster_instance_ids = "${join(",", aws_instance.cluster.*.id)}"
#   }

#   # Bootstrap script can run on any instance of the cluster
#   # So we just choose the first in this case
#   connection {
#     host = "${element(aws_instance.cluster.*.public_ip, 0)}"
#   }

#   provisioner "local-exec" {
#     # Bootstrap script called with private_ip of each node in the clutser
#     command = "bootstrap-cluster.sh ${join(" ", aws_instance.cluster.*.private_ip)}"
#   }
# }


# provisioner "local-exec" {
    commenand = "sudo mkdir /mnt/folder"
# }