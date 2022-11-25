################################################################################
# Local Tags
################################################################################

locals {
  name                      = "poc-env"
  owner                     = "devops"
  loc = "West Europe"
  main_common_tags = {
    ManagedBy  = "Terraform"
    Owner      = local.owner
    Env        = local.name
    Location = local.loc
    GitRepo = "github.com/theccz/tf-poc"
  }
}


################################################################################
# Terraform Config & Backend
################################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "tf-mgmt"
        storage_account_name = var.storave_account
        container_name       = "tfstate-${locals.name}"
        key                  = "terraform.tfstate"
    }

}

################################################################################
# Providers
################################################################################


provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias                         = "app-sub"
  subscription_id = "fabf54e7-fc37-4c80-9d84-bd626f3c2823"
  tenant_id              = "3767d0e1-2c4b-461c-867e-7668ab0d7b06"
  client_id                = "9f55cc89-d82a-4f16-bd7f-09fd99ce9216"
  client_secret      = "AXVTYRAadfvASDDFvb4234EWR$3"
  features {}
}
provider "azurerm" {
  alias                         = "prod-sub"
  subscription_id = "7458e6f6-36b2-4d75-b6a5-c143ee9547e2"
  tenant_id              = "3767d0e1-2c4b-461c-867e-7668ab0d7b06"
  client_id                = "a0d7fbe0-dca2-4848-b6ac-ad15e2c31840"
  client_secret      = "BAFHTR3235FEHsdfb%#$W%weF#@a"
  features {}
}