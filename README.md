# Self-service Platform (SSP) Bastion Module

## Summary
This module does these steps:
* Brings up a Bastion host on well-known providers like Proxmox and public cloud (TBD). 
* Installs terraform executable on the bastion host
* Installs the [SSP Provision hosts project](https://github.com/rajeshr264/ssp_provision_hosts). A terraform project that is run from the bastion host to bring up other hosts. The other hosts provide the _infrastructure_ to bring up Enterprise SW.
* Puppet Bolt executable 
* A bolt project that is specific to the Enterprise SW. For example, [Helix IPLM SW Install](https://github.com/rajeshr264/ssp_configure_iplm_hosts)
