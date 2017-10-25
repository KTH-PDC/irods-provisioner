irods-provisioner
==================

This repo hosts an Ansible iRODS provisioner which is able to set up an iRODS cluster with a replicated iCAT and several resources.

Getting started
----------------

Requirements:

* Ansible 2.1
* Vagrant 1.8 with VirtualBox support
* VirtualBox 5.0

To get started with the virtual testing environment

	git clone https://github.com/KTH-PDC/irods-provisioner.git
	cd irods-provisioner
	vagrant up
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -b -i hosts-test irods-cluster.yml

This should configure the virtual machines with a complete iRODS data grid.

To use the provided default configuration add the following to your hosts file i.e `/etc/hosts`

	192.168.56.20     rodsmaster1
	192.168.56.21     rodsmaster2
	192.168.56.22     rodsresc1
	192.168.56.23     rodsresc2
	192.168.56.24     rodsresc3
	192.168.56.25     rodsfront1

and configure your `~/.irods/irods_environment.json` as

	{
	"irods_zone_name": "tempZone",
	"irods_host": "rodsmaster1",
	"irods_user_name": "rods",
	"irods_port": 1247,
	"irods_default_hash_scheme": "SHA256",
	"irods_match_hash_policy": "strict",
	"irods_maximum_size_for_single_buffer_in_megabytes": 32,
	"irods_default_number_of_transfer_threads": 4,
	"irods_transfer_buffer_size_for_parallel_transfer_in_megabytes": 4,
	"irods_client_server_negotiation": "request_server_negotiation",
	"irods_client_server_policy": "CS_NEG_REFUSE",
	"irods_encryption_key_size": 32,
	"irods_encryption_salt_size": 8,
	"irods_encryption_num_hash_rounds": 16,
	"irods_encryption_algorithm": "AES-256-CBC",
	"irods_authentication_scheme": "native",
	"irods_default_resource": "demoResc",
	"irods_server_control_plane_port": 1248,
	"irods_server_control_plane_key": "TEMPORARY__32byte_ctrl_plane_key",
	"irods_server_control_plane_encryption_num_hash_rounds": 16,
	"irods_server_control_plane_encryption_algorithm": "AES-256-CBC"
	}
											       
		
