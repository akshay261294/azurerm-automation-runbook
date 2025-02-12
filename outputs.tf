output "id" {
  value       = azurerm_automation_runbook.this.id
  description = "The Automation Runbook ID.1"
}

output "job_schedule" {
  value       = azurerm_automation_runbook.this.job_schedule
  description = "One or more job_schedule block as defined below."
}