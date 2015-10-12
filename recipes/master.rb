#
# Cookbook Name:: jenkins
# Recipe:: master
# Author: Alexander Birk
#
include_recipe 'apt'
include_recipe 'pw_jenkins::jdk'

include_recipe 'pw_jenkins::_master_install_from_deb'

# Install all plugins with correct versions
include_recipe 'pw_jenkins::_master_install_plugins'

# Make sure that jenkins is up and running...
include_recipe 'pw_jenkins::_master_ensure_jenkins_up'

include_recipe 'pw_jenkins::_master_setup_apache_proxy'
