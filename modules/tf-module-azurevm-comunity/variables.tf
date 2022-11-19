variable "admin_password" {
  type      = string
  sensitive = true
  default   = null
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "resource_group" {
  type    = string
  default = "tf-azure-poc"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "managed_identity_principal_id" {
  type    = string
  default = null
}

variable "identity_id" {
  type    = string
  default = null
}

variable "identity_type" {
  type    = string
  default = null
}


variable "subnet_id" {
  type    = string
  default = null
}

variable "vm_os_simple_1" {
  type    = string
  default = "UbuntuServer"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}
