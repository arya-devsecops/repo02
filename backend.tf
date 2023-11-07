terraform {
  backend "azurerm" {
    resource_group_name   = "group_az"
    storage_account_name  = "dummyterraform"
    container_name        = "terrraformstate"
    key                   = "sample/vm"
  }
}
