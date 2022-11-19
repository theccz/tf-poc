locals {
  vm_name = "tf-vm-${var.owner}-${var.name}"

  common_tags = {
    ManagedBy   = "Terraform"
    Team        = var.owner
    Environment = var.name
  }
}

resource "azurerm_public_ip" "azure_vm" {
  name = "tf-azure_vm-${locals.vm_name}-public-ip"
  resource_group_name = var.resource_group
  location = var.location
  allocation_method = "Static"
  reverse_fqdn = var.hostname

}

resource "azurerm_virtual_machine" "azure_vm" {
  name                             = "${locals.vm_name}-vmLinux-${count.index}"
  resource_group_name              = var.resource_group
  location                         = var.location
  vm_size                          = var.vm_size
  network_interface_ids            = [element(azurerm_network_interface.vm.*.id, count.index)]
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  identity_type                    = var.identity_type
  identity_ids                     = var.identity_ids

  storage_image_reference {
    id        = var.vm_os.id
    publisher = var.vm_os.publisher
    offer     = var.vm_os.offer
    sku       = var.vm_os.sku
    version   = var.vm_os.latest
  }
  storage_os_disk {
    name              = "osdisk-${locals.vm_name}-${count.index}"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = var.storage_account_type
    disk_size_gb      = var.storage_os_disk_size_gb
  }

  dynamic "storage_data_disk" {
    for_each = range(var.nb_data_disk)
    content {
      name              = "${locals.vm_name}-datadisk-${count.index}-${storage_data_disk.value}"
      create_option     = "Empty"
      lun               = storage_data_disk.value
      disk_size_gb      = var.data_disk_size_gb
      managed_disk_type = var.data_sa_type
    }
  }

  dynamic "storage_data_disk" {
    for_each = var.extra_disks
    content {
      name              = "${locals.vm_name}-extradisk-${count.index}-${storage_data_disk.value.name}"
      create_option     = "Empty"
      lun               = storage_data_disk.key + var.nb_data_disk
      disk_size_gb      = storage_data_disk.value.size
      managed_disk_type = var.data_sa_type
    }
  }

  os_profile {
    computer_name  = "locals.vm_name"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  tags = merge(local.common_tags, var.tags)

}