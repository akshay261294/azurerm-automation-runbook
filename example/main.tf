#----------------------------------------
#RANDOM STRING GENERATOR
#----------------------------------------

resource "random_string" "this" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

#----------------------------------------
# RESOURCE GROUP
#----------------------------------------

resource "azurerm_resource_group" "this" {
  name     = local.rg_name
  location = local.location
}

resource "azurerm_automation_account" "this" {
  name                = local.automation_account_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = local.sku_name
}

#----------------------------------------
# TEST AUTOMATION RUNBOOK MODULE
#----------------------------------------

module "azurerm_automation_runbook" {
  source                  = "../"
  automation_account_name = azurerm_automation_account.this.name
  location                = local.location
  log_progress            = local.log_progress
  log_verbose             = local.log_verbose
  name                    = local.name
  resource_group_name     = azurerm_resource_group.this.name
  runbook_type            = local.runbook_type

  publish_content_link = local.publish_content_link
}