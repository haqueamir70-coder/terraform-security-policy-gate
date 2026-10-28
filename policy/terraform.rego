package main

import rego.v1

deny contains message if {
  input.resource_type == "azurerm_storage_account"
  input.allow_nested_items_to_be_public == true
  message := "Storage accounts must disable public nested-item access."
}

deny contains message if {
  input.resource_type == "azurerm_storage_account"
  input.https_traffic_only_enabled != true
  message := "Storage accounts must enforce HTTPS-only traffic."
}

deny contains message if {
  input.resource_type == "azurerm_storage_account"
  input.min_tls_version != "TLS1_2"
  message := "Storage accounts must require TLS 1.2 or stronger."
}

deny contains message if {
  input.resource_type == "azurerm_storage_account"
  input.public_network_access_enabled == true
  message := "Storage accounts in this lab must disable public network access."
}
