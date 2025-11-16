location                        = "switzerlandnorth"
resource_group_name             = "terrarg"
storage_account_name            = "kevwestorage"
source_content                  = "<h1> Testing terraform deployment for static website <h1>"
log_analytics_workspace_name    = "law-static-website"
log_analytics_retention_in_days = 30
monitor_diagnostic_setting_name = "diag-storage-static-website"
