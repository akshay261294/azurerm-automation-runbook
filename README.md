# azurerm-automation-runbook
Manages a Automation Runbook.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_runbook.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_runbook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | (Required) The name of the automation account in which the Runbook is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_content"></a> [content](#input\_content) | (Optional) The desired content of the runbook. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description for this credential. | `string` | `null` | no |
| <a name="input_draft"></a> [draft](#input\_draft) | (Optional) The draft block supports edit\_mode\_enabled, content\_link, output\_types, and parameters. | <pre>object({<br/>    edit_mode_enabled = optional(bool)<br/>    content_link = optional(object({<br/>      uri     = string<br/>      version = optional(string)<br/>      hash = optional(object({<br/>        algorithm = string<br/>        value     = string<br/>      }))<br/>    }))<br/>    output_types = optional(string)<br/>    parameters = optional(object({<br/>      key           = string<br/>      type          = string<br/>      mandatory     = optional(string)<br/>      position      = optional(string)<br/>      default_value = optional(string)<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_job_schedule"></a> [job\_schedule](#input\_job\_schedule) | (Optional) A job\_schedule block with schedule\_name, optional parameters, optional run\_on. | <pre>object({<br/>    schedule_name = string<br/>    parameters    = optional(map(string))<br/>    run_on        = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_log_activity_trace_level"></a> [log\_activity\_trace\_level](#input\_log\_activity\_trace\_level) | (Optional) Specifies the activity-level tracing options of the runbook, available only for Graphical runbooks. Possible values are 0 for None, 9 for Basic, and 15 for Detailed. Must turn on Verbose logging in order to see the tracing. | `number` | `null` | no |
| <a name="input_log_progress"></a> [log\_progress](#input\_log\_progress) | (Required) Progress log option. | `bool` | n/a | yes |
| <a name="input_log_verbose"></a> [log\_verbose](#input\_log\_verbose) | (Required) Verbose log option. | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Runbook. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_publish_content_link"></a> [publish\_content\_link](#input\_publish\_content\_link) | (Optional) One publish\_content\_link block supports uri, version, hash. And hash supports algorithm and value | <pre>object({<br/>    uri     = string<br/>    version = optional(string)<br/>    hash = optional(object({<br/>      algorithm = string<br/>      value     = string<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which the Runbook is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_runbook_type"></a> [runbook\_type](#input\_runbook\_type) | (Required) The type of the runbook - can be either Graph, GraphPowerShell, GraphPowerShellWorkflow, PowerShellWorkflow, PowerShell, PowerShell72, Python3, Python2 or Script. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | The timeouts for different actions on the Automation Runbook | <pre>object({<br/>    create = string<br/>    update = string<br/>    read   = string<br/>    delete = string<br/>  })</pre> | <pre>{<br/>  "create": "30m",<br/>  "delete": "30m",<br/>  "read": "5m",<br/>  "update": "30m"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Automation Runbook ID.1 |
| <a name="output_job_schedule"></a> [job\_schedule](#output\_job\_schedule) | One or more job\_schedule block as defined below. |
<!-- END_TF_DOCS -->