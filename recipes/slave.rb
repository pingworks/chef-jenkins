include_recipe 'ws-jenkins::jdk'

include_recipe 'ws-jenkins::_slave_install'

service 'jenkins-swarm-slave' do
  action [:enable, :start]
end
