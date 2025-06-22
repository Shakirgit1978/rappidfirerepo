module "recource_group" {
  source              = "../modules/resourse group"
  resource_group_name = "todoapp"
  location            = "central india"

}

module "recource_group" {
  source              = "../modules/resourse group"
  resource_group_name = "shakir"
  location            = "central india"

}
module "recource_group" {
  source              = "../modules/resourse group"
  resource_group_name = "Deepak"
  location            = "central india"


}

module "virtual_network" {
  source = "../modules/virtual network"
  depends_on = [ module.recource_group ]

  vertual_network_name = "todoappvnet"
  vnet_location        = "central india"
  resource_group_name  = "todoapp"
  address_space        = ["10.0.0.0/16"]

}


module "frontend_subnet" {
    depends_on = [ module.virtual_network ]

  source               = "../modules/subnets"
  subnet_name          = "f_subnet"
  recource_group_name  = "todoapp"
  vertual_network_name = "todoappvnet"
  address_prefixes     = ["10.0.1.0/24"]

}

module "backend_subnet" {
    depends_on = [ module.virtual_network ]

  source               = "../modules/subnets"
  subnet_name          = "b_subnet"
  recource_group_name  = "todoapp"
  vertual_network_name = "todoappvnet"
  address_prefixes     = ["10.0.2.0/24"]

}

module "frontend_vm" {
  depends_on = [ module.frontend_subnet ]

  source = "../modules/VM"
  }


  module "backendend_vm" {
    depends_on = [ module.backend_subnet ]
    source = "../modules/VM"

      }


  




  

