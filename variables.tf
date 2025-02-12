variable "name" {
  type        = string
  description = "(Required) Specifies the name of the Runbook. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which the Runbook is created. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "automation_account_name" {
  type        = string
  description = "(Required) The name of the automation account in which the Runbook is created. Changing this forces a new resource to be created."
}

variable "runbook_type" {
  type        = string
  description = "(Required) The type of the runbook - can be either Graph, GraphPowerShell, GraphPowerShellWorkflow, PowerShellWorkflow, PowerShell, PowerShell72, Python3, Python2 or Script. Changing this forces a new resource to be created."
}

variable "log_progress" {
  type        = string
  description = "(Required) Progress log option."
}

variable "log_verbose" {
  type        = string
  description = "(Required) Verbose log option."
}

# ----------------------------------------------------------------------------------
#  OPTIONAL VARIABLES
# ----------------------------------------------------------------------------------

variable "publish_content_link" {
  type = object({
    uri     = string
    version = optional(string)
    hash = optional(object({
      algorithm = string
      value     = string
    }))
  })
  default     = null
  description = "(Optional) One publish_content_link block supports uri, version, hash. And hash supports algorithm and value"
}

variable "description" {
  type        = string
  description = "(Optional) A description for this credential."
  default     = null
}

variable "content" {
  type        = string
  description = "(Optional) The desired content of the runbook."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = null
}

variable "log_activity_trace_level" {
  type        = number
  description = "(Optional) Specifies the activity-level tracing options of the runbook, available only for Graphical runbooks. Possible values are 0 for None, 9 for Basic, and 15 for Detailed. Must turn on Verbose logging in order to see the tracing."
  default     = null
}

variable "draft" {
  type = object({
    edit_mode_enabled = optional(bool)
    content_link = optional(object({
      uri     = string
      version = optional(string)
      hash = optional(object({
        algorithm = string
        value     = string
      }))
    }))
    output_types = optional(string)
    parameters = optional(object({
      key           = string
      type          = string
      mandatory     = optional(string)
      position      = optional(string)
      default_value = optional(string)
    }))
  })
  description = "(Optional) The draft block supports edit_mode_enabled, content_link, output_types, and parameters."
  default     = null
}

variable "job_schedule" {
  type = object({
    schedule_name = string
    parameters    = optional(map(string))
    run_on        = optional(string)
  })
  description = "(Optional) A job_schedule block with schedule_name, optional parameters, optional run_on."
  default     = null
}

variable "timeouts" {
  description = "The timeouts for different actions on the Automation Runbook"
  type = object({
    create = string
    update = string
    read   = string
    delete = string
  })
  default = {
    create = "30m"
    update = "30m"
    read   = "5m"
    delete = "30m"
  }
}