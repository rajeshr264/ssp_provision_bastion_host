terraform {
  required_version = ">= 1.9.5"

  required_providers {
     proxmox = {
      source = "bpg/proxmox"
      version = ">= 0.64.0"
    }
    
   random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "proxmox" {
  endpoint = "${var.proxmox_host_endpoint}"
  username = var.proxmox_host_username
  password = var.proxmox_host_password
  insecure = true  # Set to false in production
  ssh {
    agent = true
  }
} 
