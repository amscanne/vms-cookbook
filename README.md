Description
===========

Installs the Gridcentric VMS platform from Gridcentric's package repository.

See http://docs.gridcentric.com/openstack for instructions on how to obtain
access keys and documentation for VMS.

Requirements
============

This cookbook has been tested with Chef 0.10.12.

Platforms
---------

The hypervisor/host recipes (api, client and compute) were tested against the
following platforms:

* Ubuntu-12.04 (Precise Pangolin)

The guset recipe was tested against the following platforms:

* Ubuntu-12.04 (Precise Pangolin)
* Centos 6

The all recipes should work on any platform with apt or yum.

Cookbooks
---------

This cookbook is dependent on the following cookbooks:

* apt
* yum

External Dependencies
---------------------

Gridcentric VMS is installed on a stock Openstack installation newer than the
"diablo" release. This cookbook expects a stock Openstack Essex
installation. This cookbook has been tested against the openstack cookbooks
maintained by Rackspace (https://github.com/rcbops/chef-cookbooks).

Data Bags
=========

This cookbook looks for the repository private key in the `gridcentric/repos`
databag. An example databag should have been provided with this cookbook. Simply
substitute your private access key into the repos.json file and import the
databag into your chef server.

Relevant keys are: 
* `gridcentric/repos/private_key`: Used to access the private Gridcentric
  repositories containing the host-side VMS packages
* `gridcentric/repos/public_key`: Used to access the public Gridcentic
  repositories containing the guest VMS packages. At the moment, this repository
  provides the various guest agent packages.


Recipes
=======

compute
-------
- Installs the VMS compute packages and relevant openstack extensions.
- Should be installed on openstack compute nodes.

api
---
- Installs the api packages for servicing VMS requests.
- Should be installed on openstack api nodes.

client
------
- Installs the python bindings for the openstack VMS extension. Useful for
  issuing VMS requests to an VMS-enabled openstack cluster.


agent
-----
- Installs the VMS gust packages.
- Should be installed on any instance which will be blessed using VMS.