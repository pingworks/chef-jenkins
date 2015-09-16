#
# Cookbook Name:: jenkins
# Recipe:: master
# Author: Alexander Birk
#
include_recipe 'base'

include_recipe 'jenkins::jdk'

include_recipe 'jenkins::_master_install_from_deb'

# Install all plugins with correct versions
include_recipe 'jenkins::_master_install_plugins'

# Make sure that jenkins is up and running...
include_recipe 'jenkins::_master_ensure_jenkins_up'
