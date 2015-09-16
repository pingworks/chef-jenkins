include_recipe 'base'

include_recipe 'jenkins::jdk'

include_recipe 'jenkins::_slave_install'

service 'jenkins-swarm-slave' do
  action [:enable, :start]
end
