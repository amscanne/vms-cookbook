#
# Cookbook Name:: vms
# Recipe:: dashboard
#
# Copyright 2012, Gridcentric Inc.
#

include_recipe "apt"
include_recipe "vms::client"

::Chef::Resource::AptRepository.send(:include, Gridcentric::Vms::Helpers)

if not platform?("ubuntu")
  raise "Unsupported platform: #{node["platform"]}"
end

apt_repository "gridcentric-#{node["vms"]["os-version"]}" do
  uri construct_repo_uri(node["vms"]["os-version"], node)
  components ["gridcentric", "multiverse"]
  key construct_key_uri(node)
  notifies :run, resources(:execute => "apt-get update"), :immediately
  only_if { platform?("ubuntu") }
end

package "horizon-gridcentric" do
  action :install
  options "-o APT::Install-Recommends=0"
end
