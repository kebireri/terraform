# Create resource group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Create storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.storage_account.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "index.html" // Should be same as the index document of the static website
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
  depends_on             = [azurerm_storage_account_static_website.static_website]

}

# Create log analytics workspace
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_analytics_retention_in_days
}

# Configure monitor diagnostic setting
resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name = var.monitor_diagnostic_setting_name
  # Attach to the BLOB service of the storage account
  target_resource_id = "${azurerm_storage_account.storage_account.id}/blobServices/default"

  # Send logs/metrics to your Log Analytics workspace
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id

  # Logs to be collected

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  # Metrics
  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

