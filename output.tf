output "dhcp_ip" {
  value = proxmox_virtual_environment_vm.ubuntu_vm.ipv4_addresses[1]
}