variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "Name of virtual machine"
  type        = string
  default     = "tf-test-01"
}

variable "vm_username" {
  description = "Username for the VM"
  type        = string
}

variable "vm_password" {
  description = "Password for the VM user"
  type        = string
  sensitive   = true
}

variable "vms" {
  description = "VM configurations"

  type = map(object({
    name        = string
    ip          = string
    gateway     = string
    dns_servers = list(string)
    cores       = number
    memory      = number
    disk        = number
  }))
}

# variable "vm_ip_address" {
#   description = "Static IPv4 address for the VM in CIDR notation"
#   type        = string
# }

# variable "vm_gateway" {
#   description = "Default gateway for the VM"
#   type        = string
# }
