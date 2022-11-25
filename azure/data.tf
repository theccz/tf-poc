data "azurerm_subnet" "pub_sub" {
  name                 = "Public Subnet 1"
  virtual_network_name = "tf-poc-public-subnet"
  resource_group_name  = "networking"
}


data "azurerm_virtual_network" "pub_virt_net" {
  name                = "tf-poc"
  resource_group_name = "networking"
}