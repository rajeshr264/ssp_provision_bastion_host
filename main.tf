data "local_file" "bastion_host_public_key_filename" {
  filename = var.bastion_host_public_key_filename
}

# random number range
resource "random_integer" "rand" {
  min = 5000
  max = 9000
}

resource "proxmox_virtual_environment_vm" "vm" {
  name      = "bastion-${random_integer.rand.result}"
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
    full = false 
  }

  network_device {
    bridge = var.proxmox_network_bridge_name
  }
}