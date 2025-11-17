# ==========================================================
# Commands and Queries for the Static Website Terraform Project
# NOTE: This file is for EDUCATIONAL / REFERENCE purposes.
#       It is NOT intended to be executed as a script.
# ==========================================================


# ==========================================================
# 1. TERRAFORM COMMANDS
# ==========================================================

# Initialize Terraform (downloads providers, sets up .terraform/)
terraform init

# Format Terraform files
terraform fmt

# Validate Terraform configuration
terraform validate

# Show planned changes (what Terraform will create/update/destroy)
terraform plan

# Apply the changes (actually create/update resources in Azure)
terraform apply

# Destroy all resources managed by this configuration (optional)
# terraform destroy



# ==========================================================
# 2. STATIC WEBSITE TESTING (CURL)
# ==========================================================

# Set your static website endpoint (example shown, replace with real one)
# ENDPOINT="https://kevwestorage.z13.web.core.windows.net"
ENDPOINT="https://<your-static-website-endpoint>"

# Test the homepage
# curl -i "$ENDPOINT"

# Generate a 404 to produce extra logs (good for diagnostics)
# curl -i "$ENDPOINT/does-not-exist.html"



# ==========================================================
# 3. LOG ANALYTICS QUERIES (KQL)
# ==========================================================
# These queries are run in:
#   Azure Portal -> Log Analytics Workspace -> Logs
# NOT in the shell/Bash. They are just stored here for reference.
# Commented so Bash will ignore them.

# ------------------------------
# 3.1 General storage log check
# ------------------------------
# search *
# | where ResourceProvider == "MICROSOFT.STORAGE"
# | take 50

# ------------------------------
# 3.2 Blob access logs (requests to static website)
# ------------------------------
# StorageBlobLogs
# | take 50

# ------------------------------
# 3.3 Detailed blob request information
# ------------------------------
# StorageBlobLogs
# | project
#     TimeGenerated,
#     OperationName,
#     RequestUrl,
#     StatusCode,
#     CallerIpAddress
# | order by TimeGenerated desc

# ------------------------------
# 3.4 Storage metrics (from AzureMetrics table)
# ------------------------------
# AzureMetrics
# | where ResourceId contains "storageAccounts"
# | take 20
