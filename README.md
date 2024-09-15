# Self-service Platform Bastion Module

## Summary
This module brings up a Bastion host on well-known providers like Proxmox and public cloud (TBD). 

It then does steps:
* Installs terraform
* A terraform project that brings up hosts that provide the infrastructure to bring up Enterprise SW.
* Puppet Bolt
* A bolt project that is specific to the Enterprise SW  
