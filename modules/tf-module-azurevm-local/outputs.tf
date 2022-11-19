output "identity_type" {
  value = azurerm_virtual_machine.azure_vm.identity
}

output "ip_address" {
  value       = azurerm_public_ip.azure_vm.id
}

output "vm_public_name" {
  value       = azurerm_public_ip.azure_vm.fqdn
  }