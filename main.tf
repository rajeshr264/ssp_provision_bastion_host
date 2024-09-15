resource "proxmox_virtual_environment_vm" "var.proxmox_bastion_host_name" {
  name      = var.proxmox_bastion_host_name
  node_name = var.proxmox_node_name

  initialization {

    ip_config {
      ipv4 {
       address = "dhcp"
      }
    }

    user_account {
      username = var.bastion_host_username
      keys     = [trimspace(var.ssh_public_key.content)]
      password = var.bastion_host_password
    }
  }

  clone{
    vm_id = var.proxmox_machine_image_template_id
  }

  network_device {
    bridge = var.proxmox_network_bridge_name
  }
}