terraform{

backend "azurerm" {
    resource_group_name  = "rg-infrastructure-prod-germanywc-01"
    storage_account_name = "stinfrastoracc01prod"
    container_name       = "tfstate"
    key                  = "danieltest.terraform.tfstate"
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "rg" {
        name = "QuickstartTerraformTest-rg"
        location = "eastus"
}

module "storage-account" {
  source  = "picta/storage-account/azurerm"
  version = "5.0"
  # insert the required variables here
  location = "eastus"
  resource_group_name = "QuickstartTerraformTest-rg"
  storage_account_name = "danielstest"
}
