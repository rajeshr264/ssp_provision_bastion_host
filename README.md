# Self-service Platform Bastion Module

## Summary
This module brings up a Bastion host on well-known providers like Proxmox and public cloud (TBD). It then does steps:
* terraform
* A terraform project that brings up hosts that provide the infrastructure to bring up Enterprise SW.
* Puppet Bolt
* A bolt project that is specific to the Enterprise SW  

From the bastion host, provision other hosts that constitute the Infrastructure used for a Distributed Enterprise SW. 

The with user specified arguments. These arguments can be:
* The set of users allowed on the hosts.
* External Facts that help tag the hosts. These facts will be referenced in the Configuration management code that run after the provisioning step.
* Configuration management tool, Puppet-Bolt will be installed on the 
## Tasks
* Provision a Bastion Host that will be used to run Bolt 
* Provision one or more hosts that serve as the infrastructure for any complex Distributed Enterprise SW. These (Puppet) *External Facts* can be installed on these nodes to help with the next step, Configuration management.
