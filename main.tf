terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tej-rg"
    storage_account_name = "jaffaastorageaccount"
    container_name       = "jaffaaastoragecontainer"
    key                  = "terraform.newfile"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b02b567a-e4cb-4c73-975e-4664c82c8fc3"
}

resource "azurerm_resource_group" "jaadu1" {
  name     = "jaadu-rg"
  location = "East US"
}
resource "azurerm_storage_account" "jaadu1" {
  name                     = "jaadustorageacct"
  resource_group_name      = azurerm_resource_group.jaadu1.name
  location                 = azurerm_resource_group.jaadu1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_account" "jaadu2" {
  name                     = "jaadustorageacct2"
  resource_group_name      = azurerm_resource_group.jaadu1.name
  location                 = azurerm_resource_group.jaadu1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}