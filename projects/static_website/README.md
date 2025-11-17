## Overview
This folder is part of a broader learning journey focused on Infrastructure as Code (IaC). Its purpose is to demonstrate how Terraform can be used to declaratively structure, manage, and repeatedly provision cloud resources, instead of relying on manual Azure Portal steps.

The project contains a self-contained Terraform configuration that deploys a static website to Azure Storage. It defines all infrastructure components: provider configuration, variables, resource definitions, and the remote backend for Terraform state, using standard IaC practices. The deployment includes the static website itself as well as diagnostic settings and monitoring through Azure Log Analytics.



## Project Folder Structure
```

├── backend.tf          # Remote backend configuration (optional)
├── provider.tf         # AzureRM provider setup
├── main.tf             # Core infrastructure: RG, storage account, static website, diagnostics
├── variables.tf        # Input variable definitions
├── terraform.tfvars    # Concrete variable values
└── commands.sh         # All Terraform, curl, and KQL queries (educational reference)

```
---
This Terraform configuration provisions the core Azure resources required to host a static website. It includes a resource group, a storage account configured for static website hosting, and a remote backend configuration for managing Terraform state.

## Infrastructure Components

This Terraform configuration deploys:

1. Resource Group

    A logical container for all Azure resources in the project.

2. Storage Account (Static Website Enabled)

    Configured to host static content via the $web container.
    The index.html file is uploaded automatically via Terraform.

3. Log Analytics Workspace

    Used to store platform metrics and blob access logs.

4. Diagnostic Settings

    Diagnostic Settings are applied to the blob service of the storage account.
    They send blob access logs (read/write/delete events) and storage metrics (transactions, latency, availability) to the Log Analytics Workspace for monitoring and analysis.