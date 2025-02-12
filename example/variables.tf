locals {
  name  = "${random_string.this.result}-AR"
  rg_name = "${random_string.this.result}-RG"
  automation_account_name = "${random_string.this.result}-AA"
  location = "West Europe"
  sku_name = "Basic"
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This is an example runbook"
  runbook_type            = "PowerShellWorkflow"
  publish_content_link = {
    uri = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
  }
}