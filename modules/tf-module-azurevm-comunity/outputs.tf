output "identity_type" {
  value = module.azure_vm.vm_identity
}

output "ip_address" {
  value = module.azure_vm.public_ip_address
}

output "vm_public_name" {
  value = module.azure_vm.public_ip_dns_name
}