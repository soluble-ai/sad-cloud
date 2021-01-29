variable "linux_agent_vm_size_allowedvalues" {
  type = map

  default = {
    "Standard_A0"     = "Standard_A0"
    "Standard_A1"     = "Standard_A1"
    "Standard_A2"     = "Standard_A2"
    "Standard_A3"     = "Standard_A3"
    "Standard_A4"     = "Standard_A4"
    "Standard_A5"     = "Standard_A5"
    "Standard_A6"     = "Standard_A6"
    "Standard_A7"     = "Standard_A7"
    "Standard_A8"     = "Standard_A8"
    "Standard_A9"     = "Standard_A9"
    "Standard_A10"    = "Standard_A10"
    "Standard_A11"    = "Standard_A11"
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags {
    Source = "Azure Quickstarts for Terraform"
  }
}

resource "azurerm_container_service" "container_service" {
  name                   = "k8s-containerservice"
  resource_group_name    = azurerm_resource_group.resource_group.name
  location               = var.resource_group_location
  orchestration_platform = "Kubernetes"

  master_profile {
    count      = var.master_count
    dns_prefix = "${var.dns_name_prefix}"-master
  }

  agent_pool_profile {
    name       = "agentpools"
    count      = var.linux_agent_count
    dns_prefix = var.dns_name_prefix
    vm_size    = var.linux_agent_vm_size_allowedvalues[var.linux_agent_vm_size]
  }

  linux_profile {
    admin_username = var.linux_admin_username

    ssh_key {
      key_data = var.linux_admin_ssh_publickey
    }
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  diagnostics_profile {
    enabled = false
  }

  tags {
    Source = "Azure Quickstarts for Terraform"
  }
}

output "master_fqdn" {
  value = "${azurerm_container_service.container_service.master_profile.fqdn}"
}

output "ssh_command_master0" {
  value = "ssh ${var.linux_admin_username}@${azurerm_container_service.container_service.master_profile.fqdn} -A -p 22"
}
