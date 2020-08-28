terraform {
  required_version = "=2.20.0"
}

provider "azurerm" {
  version = "=2.20.0"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}"
  location                 = "${var.location}"
  account_tier             = "${var.storage_account_tier}"
  resource_group_name      = "${var.resource_group_name}"
  account_replication_type = "${var.storage_account_replication_type}"

  network_rules {
    default_action             = "${var.default_action}"
    virtual_network_subnet_ids = ["${var.virtual_network_subnet_ids}"]
  }
}