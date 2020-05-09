resource "azurerm_virtual_machine" "vm1" {
  name = "vm1"                 #aws ec2 instance
  location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.nic1.id}"]
  vm_size = "Standard_DS1_v2"         #aws t2.micro etc
  storage_image_reference {          # aws ami 
    publisher = "OpenLogic"          
    offer = "CentOS"
    sku = "7.5"              #version
    version = "latest"         #state
  }
  storage_os_disk {            # aws ebs
    name = "myosdisk1"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {                        #password
    computer_name = "vm1"
    admin_username = "centos"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false      //true or false 
  }
  tags {
    environment = "staging"
  }
}