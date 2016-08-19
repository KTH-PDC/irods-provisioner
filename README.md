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
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -b -i hosts-test irods-icat.yml

This should configure the virtual machines with a complete iRODS data grid.
