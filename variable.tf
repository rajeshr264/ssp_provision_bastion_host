# variables.tf
variable "bastion_host_password" {
  description = "The password for the bastion host"
  type        = string
  sensitive   = true
}

variable "bastion_host_username" {
  description = "The username for the bastion host"
  type        = string
  sensitive   = true
}

variable "bastion_host_public_key_filename" {
  description = "The filename for the public key for the bastion host"
  type        = string
  sensitive   = true
}

variable "proxmox_machine_image_template_id" {
  description = "ID of the Machine image template in Proxmox "
  type        = string
  default     = "9002"
}

variable "proxmox_node_name" {
  description = "Name of the Proxmox host"
  type        = string
  default     = "pve"
}

variable "proxmox_network_bridge_name" {
  description = "Name of the Proxmox network bridge"
  type        = string
  default     = "vmbr0"
} 


variable "proxmox_host_endpoint" {
  description = "Endpoint of the proxmox host"
  type        = string
  //sensitive   = true
}

variable "proxmox_host_username" {
  description = "Username to log in to the proxmox host"
  type        = string
  sensitive   = true
}

variable "proxmox_host_password" {
  description = "Password to log in to the proxmox host"
  type        = string
  sensitive   = true
}
