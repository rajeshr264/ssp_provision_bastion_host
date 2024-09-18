#!/bin/bash -vx

export DEBIAN_FRONTEND=noninteractive

# Loop until the lsof command returns 0 results
while sudo lsof /var/lib/dpkg/lock-frontend; do
  echo "Lock file is still in use. Waiting for 10 seconds..."
  sleep 10
done
echo "Lock file is no longer in use. Proceeding..."

# Update and upgrade the system
sudo dpkg --configure -a
sudo apt install -f
sudo apt dist-upgrade -y


# Install security tools and utilities
sudo apt install git curl wget python3-pip -y

# Disable root SSH login and password-based authentication
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Set SSH idle timeout to 300 seconds (5 minutes)
echo "ClientAliveInterval 300" | sudo tee -a /etc/ssh/sshd_config
echo "ClientAliveCountMax 0" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# Install Terraform
sudo apt-get install -y gpg software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y && sudo apt-get install terraform -y

# Install Puppet Bolt 
curl -O https://apt.puppet.com/puppet-tools-release-jammy.deb
sudo dpkg -i puppet-tools-release-jammy.deb
sudo apt-get update 
sudo apt-get install puppet-bolt -y

# Enable unattended upgrades
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Final message
echo "System configured successfully."
