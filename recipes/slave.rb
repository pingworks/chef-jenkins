include_recipe 'apt'
include_recipe 'pw_jenkins::jdk'

include_recipe 'pw_jenkins::_slave_install'

service 'jenkins-swarm-slave' do
  action [:enable, :start]
end
