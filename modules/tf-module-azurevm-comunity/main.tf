locals {
  vm_name = "tf-vm-${var.owner}-${var.name}"

  common_tags = {
    ManagedBy   = "Terraform"
    Team        = var.owner
    Environment = var.name
  }
}

module "azure_vm" {

  source                           = "Azure/compute/azurerm"
  version                          = "4.0.0"
  vm_hostname                      = locals.vm_name
  resource_group_name              = var.resource_group
  location                         = var.location
  admin_username                   = var.admin_username
  admin_password                   = var.admin_password
  vm_os_simple                     = var.vm_os_simple_1
  public_ip_dns                    = [var.ip_dns]
  vnet_subnet_id                   = var.subnet_id
  allocation_method                = "Static"
  public_ip_sku                    = "Standard"
  enable_accelerated_networking    = true
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  ssh_key                          = fileexists("~/.ssh/id_rsa.pub") ? "~/.ssh/id_rsa.pub" : ""
  vm_size                          = "Standard_DS2_V2"
  nb_data_disk                     = 2
  identity_type                    = "UserAssigned"
  identity_ids                     = [var.identity_id]
  tags                             = merge(local.common_tags, var.tags)
}
