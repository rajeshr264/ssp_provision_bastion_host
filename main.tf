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

# Run a local post-install script that checks if the bastion host is up and running
resource "null_resource" "check_bastion_host_ready" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/check_bastion_host_ready.sh ${proxmox_virtual_environment_vm.vm.ipv4_addresses[1][0]} ${var.bastion_host_private_key_filename} ${var.bastion_host_username}"
  }
  depends_on = [proxmox_virtual_environment_vm.vm]
}

# Run a local post-install script that checks if the bastion host is up and running
resource "null_resource" "setup_bastion" {
  provisioner "local-exec" {
    command = "bolt plan run ssp_provision_bastion_host::setup_bastion -i ./bastion_inventory.yaml -t bastion"
  }
  depends_on = [null_resource.check_bastion_host_ready]
}
