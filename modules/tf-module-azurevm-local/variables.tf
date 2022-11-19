publisher = "Canonical"
offer     = "UbuntuServer"
sku       = "16.04-LTS"
version   = "latest"

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

variable "hostname" {
  type    = string
  default = "null"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "identity_id" {
  type    = string
  default = null
}

variable "vm_size" {
  type    = int
  default = null
}

variable "storage_account_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  type        = string
  default     = "Premium_LRS"
}

variable "storage_os_disk_size_gb" {
  description = "(Optional) Specifies the size of the data disk in gigabytes."
  type        = number
  default     = null
}

variable "data_sa_type" {
  description = "Data Disk Storage Account type."
  type        = string
  default     = "Standard_LRS"
}

variable "data_disk_size_gb" {
  description = "Storage data disk size size."
  type        = number
  default     = 30
}

variable "identity_type" {
  type    = string
  default = null
}

variable "delete_os_disk_on_termination" {
  type        = bool
  description = "Delete datadisk when machine is terminated."
  default     = false
}

variable "delete_data_disks_on_termination" {
  type        = bool
  description = "Delete data disks when machine is terminated."
  default     = false
}