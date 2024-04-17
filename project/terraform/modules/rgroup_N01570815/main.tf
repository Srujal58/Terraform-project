resource "azurerm_resource_group" "N01570815_Rg" {
  name     = var.N01570815_Rg
  location = var.N01570815_location
  tags     = var.common_tags
}
