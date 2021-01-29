variable "resource_group_name" {
  type        = string
  default     = "azure-resource"
}

variable "resource_group_location" {
  type        = string
  default     = "Australia East"
}

variable "dns_name_prefix" {
  type        = string
  default     = "myDns"
}

variable "linux_agent_count" {
  type        = string
  default     = "1"
}

variable "linux_agent_vm_size" {
  type        = string
  default     = "Standard_D2_v2"
}

variable "linux_admin_username" {
  type        = string
  default     = "microsoft"
}

variable "linux_admin_ssh_publickey" {
  type        = string
  default     = "SOME_PUBLIC_KEY"
}

variable "master_count" {
  type        = string
  default     = "1"
}

variable "client_id" {
  type        = string
  default     = "my_client_id"
}

variable "client_secret" {
  type        = string
  default     = "my-client-secret"
}

variable "tenant_id" {
  type        = string
  default     = "SOME-ID"
}

variable "subscription_id" {
  type        = string
  default     = "SOME-ID"
}

variable "customVmName" {
  type        = string
  default     = "my-vm-example"
}

variable "userImageStorageAccountName" {
  type        = string
  default     = "my-storage-example"
}

variable "userImageStorageAccountResourceGroupName" {
  type        = string
  default     = "my-resource-group"
}

variable "osDiskVhdUri" {
  type        = string
  default     = "dummy-uri"
}

variable "dnsLabelPrefix" {
  type        = string
  default     = "dummy-dns"
}

variable "adminUserName" {
  type        = string
  default     = "azureadmin"
}

variable "adminPassword" {
  type        = string
  default     = "azureapwd"
}

variable "osType" {
  type        = string
  default     = "linux"
}

variable "vmSize" {
  type        = string
  default     = "Standard_A1"
}

variable "newOrExistingVnet" {
  type        = string
  default     = "new"
}

variable "newOrExistingVnetName" {
  type        = string
  default     = "myvnet"
}

variable "newOrExistingSubnetName" {
  type        = string
  default     = "mysubnet"
}

variable "resourceGroupName" {
  type        = string
  default     = "vmuserimagelinux"
}

variable "resourceGroupLocation" {
  type        = string
  default     = "Australia East"
}
