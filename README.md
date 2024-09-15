# Self-service Platform-Provision Module

## Summary
This module's main job is to bring up hosts, with user specified arguments. These arguments can be:
* The set of users allowed on the hosts.
* External Facts that help tag the hosts. These facts will be referenced in the Configuration management code that run after the provisioning step.

## 
* Provision a Bastion Host with user defined arguments like which users are allowed on the host and 
* Provision one or more hosts that serve as the infrastructure for any complex Distributed Enterprise SW. These (Puppet) *External Facts* can be installed on these nodes to help with the next step, Configuration management.
