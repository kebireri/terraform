## Overview
This folder is part of a broader learning journey focused on Infrastructure as Code (IaC). Its purpose is to show how Terraform can be used to structure, manage, and repeatably provision cloud resources in a clear, organised way, reinforcing core IaC practices rather than relying on manual portal-based deployments.

This project contains a self-contained Terraform configuration for deploying a static website to Azure Storage. It defines all required infrastructure declaratively, including the Azure provider setup, variable definitions, resource configurations, and the remote backend used to store Terraform state.

## Project Folder Structure
```

├── backend.tf         #Remote backend configuration (Terraform state in Azure Storage)
├── provider.tf        #AzureRM provider setup
├── main.tf            #Infrastructure resources (resource group, storage account, static website settings)
├── variables.tf       #Variable definitions
└── terraform.tfvars   #Input values for variables
```
---
This Terraform configuration provisions the core Azure resources required to host a static website. It includes a resource group, a storage account configured for static website hosting, and a remote backend configuration for managing Terraform state.