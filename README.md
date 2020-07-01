# tf-module-gcp-logging

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| include\_children | Only valid if 'organization' or 'folder' is chosen as var.parent_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included. | `bool` | `false` | no |
| log\_sinks | Map of the filters to assign to the log sink. | `list(object({ name   = string filter = string }))` | n/a | yes |
| parent\_resource\_id | The ID of the GCP resource in which you create the log sink. If var.parent_resource_type is set to 'project', then this is the Project ID (and etc). | `string` | n/a | yes |
| parent\_resource\_type | The GCP resource in which you create the log sink. The value must not be computed, and must be one of the following: 'project', 'folder', 'billing_account', or 'organization'. | `string` | `"project"` | no |
| storage\_bucket\_name | The name of the bucket where logs will be stored. | `string` | n/a | yes |
| unique\_writer\_identity | Whether or not to create a unique identity associated with this sink. If false (the default), then the writer_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink. | `bool` | false | no | 

## Outputs

| Name | Description |
|------|-------------|
| log\_sink\_resource\_id | The resource ID of the log sink that was created. |
| writer\_identity | The service account that logging uses to write log entries to the destination. |
