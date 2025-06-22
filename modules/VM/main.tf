resource "azurerm_network_interface" "frontend_nic" {
    name = "f_nic"
    resource_group_name = "todoapp"
    location = "Central india"

    ip_configuration {
        name = "internal"
        subnet_id = data.azurerm_subnet.frontend_subnet.id
        private_ip_address_allocation = "Dynamic"
      
    }
  
}


resource "azurerm_linux_virtual_machine" "frontend_vm" {

    name = "frontendvm"
    resource_group_name= "todoapp"
    location = "Central india"
    size = "Standard_F2s_v2"
    admin_username ="shakiradmin"
    admin_password = "Admin@123!"
    disable_password_authentication = false
    


    network_interface_ids =[
        azurerm_network_interface.frontend_nic.id]
    
   
    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}




resource "azurerm_network_interface" "backend_nic" {
          name = var.b_nic
          resource_group_name = var.resource_group_name
          location = var.location

          ip_configuration {
            name = "internal"
            subnet_id =data.azurerm_subnet.backend_subnet.id
            private_ip_address_allocation = "Dynamic"

          }
}



resource "azurerm_linux_virtual_machine" "backendend_vm" {

    name = "backendendvm"
    resource_group_name= "todoapp"
    location = "Central india"
    size = "Standard_F2s_v2"
    admin_username ="shakiradmin"
    admin_password = "Admin@123!"
    disable_password_authentication = false


    network_interface_ids =[
        azurerm_network_interface.backend_nic.id]
    
   
    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

output "fsubnet_id" {
  value = data.azurerm_subnet.frontend_subnet.id
}
  
output "bsubnet_id" {
  value = data.azurerm_subnet.backend_subnet.id
}

