# Self-service Platform (SSP) Bastion Module

## Summary

This module was built to create a bastion host for every user. A bastion host provides a consistent environment for building and managing the infrastructure for running an Enterprise SW. It will have all the SW and content necessary.

This module does these steps:
* Build a Bastion host on well-known providers like Proxmox and public cloud (TBD). 
* Installs terraform executable on the bastion host
* Installs the [SSP Provision hosts project](https://github.com/rajeshr264/ssp_provision_hosts). A terraform project that is run from the bastion host to bring up other hosts. The other hosts provide the _infrastructure_ to bring up Enterprise SW.
* Puppet Bolt executable 
* A bolt project that is specific to the Enterprise SW. For example, [Helix IPLM SW Install](https://github.com/rajeshr264/ssp_configure_iplm_hosts)
