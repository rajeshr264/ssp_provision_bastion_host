data "local_file" "bastion_host_public_key_filename" {
  filename = var.bastion_host_public_key_filename
}


resource "proxmox_virtual_environment_vm" "vm" {
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
      keys     = [trimspace(data.local_file.bastion_host_public_key_filename.content)]
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