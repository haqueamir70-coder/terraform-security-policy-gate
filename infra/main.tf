terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "security_lab" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    project     = "terraform-security-policy-gate"
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_storage_account" "secure" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.security_lab.name
  location                        = azurerm_resource_group.security_lab.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false
  public_network_access_enabled   = false

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 7
    }
  }

  tags = {
    project     = "terraform-security-policy-gate"
    environment = var.environment
    data_class  = "lab"
  }
}
