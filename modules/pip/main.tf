 resource "azurerm_public_ip" "F_pip" {
    name = var.frontend_pip
    resource_group_name = var.recource_group_name
    location = var.location
    allocation_method   = var.allocation_method
 }