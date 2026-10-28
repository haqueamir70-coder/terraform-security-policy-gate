variable "resource_group_name" {
  description = "Name of the lab resource group."
  type        = string
  default     = "rg-tf-security-gate-lab"
}

variable "location" {
  description = "Azure region for the lab resources."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment tag value."
  type        = string
  default     = "lab"
}

variable "storage_account_name" {
  description = "Globally unique, 3-24 lowercase alphanumeric Azure Storage account name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "The storage account name must contain 3-24 lowercase letters or numbers."
  }
}
