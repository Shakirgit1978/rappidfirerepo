data "azurerm_subnet" "frontend_subnet"{

name = "f_subnet"

virtual_network_name = "todoappvnet"

resource_group_name = "todoapp"

}




data "azurerm_subnet" "backend_subnet"{

name = "b_subnet"

virtual_network_name = "todoappvnet"

resource_group_name = "todoapp"

}




