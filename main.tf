resource "azurerm_automation_runbook" "this" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  automation_account_name  = var.automation_account_name
  log_verbose              = var.log_verbose
  log_progress             = var.log_progress
  description              = var.description
  runbook_type             = var.runbook_type
  content                  = var.content
  tags                     = var.tags
  log_activity_trace_level = var.log_activity_trace_level

  dynamic "publish_content_link" {
    for_each = toset(try(var.publish_content_link, null) != null ? ["*"] : [])
    content {
      uri     = try(var.publish_content_link.uri, null)
      version = try(var.publish_content_link.version, null)
      dynamic "hash" {
        for_each = toset(try(var.publish_content_link.hash, null) != null ? ["*"] : [])
        content {
          algorithm = try(var.publish_content_link.hash.algorithm, null)
          value     = try(var.publish_content_link.hash.value, null)
        }
      }
    }
  }

  dynamic "draft" {
    for_each = toset(try(var.draft, null) != null ? ["*"] : [])
    content {
      edit_mode_enabled = try(var.draft.edit_mode_enabled, null)
      dynamic "content_link" {
        for_each = toset(try(var.draft.content_link, null) != null ? ["*"] : [])
        content {
          uri     = try(var.draft.content_link.uri, null)
          version = try(var.draft.content_link.version, null)
          dynamic "hash" {
            for_each = toset(try(var.draft.content_link.hash, null) != null ? ["*"] : [])
            content {
              algorithm = try(var.draft.content_link.hash.algorithm, null)
              value     = try(var.draft.content_link.hash.value, null)
            }
          }
        }
      }
      output_types = try(var.draft.output_types, null)
      dynamic "parameters" {
        for_each = toset(try(var.draft.parameters, null) != null ? ["*"] : [])
        content {
          key           = try(var.draft.parameters.key, null)
          type          = try(var.draft.parameters.type, null)
          mandatory     = try(var.draft.parameters.mandatory, null)
          position      = try(var.draft.parameters.position, null)
          default_value = try(var.draft.parameters.default_value, null)
        }
      }
    }
  }

  dynamic "job_schedule" {
    for_each = toset(try(var.job_schedule, null) != null ? ["*"] : [])
    content {
      schedule_name = try(var.job_schedule.schedule_name, null)
      parameters    = try(var.job_schedule.parameters, null)
      run_on        = try(var.job_schedule.run_on, null)
    }
  }
}