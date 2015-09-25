remote_file '/var/tmp/chefdk.deb' do
  source node['ws-jenkins']['chefdk']['url']
  checksum node['ws-jenkins']['chefdk']['sha256']
end

bash 'install chefdk' do
  code <<-EOC
    dpkg -i /var/tmp/chefdk.deb
  EOC
  not_if 'dpkg -s chefdk'
end

bash 'install kitchen-openstack' do
  user 'jenkins'
  cwd '/var/lib/jenkins'
  code <<-EOC
  export HOME=/var/lib/jenkins
  eval "$(chef shell-init bash)"
  chef gem install kitchen-openstack
  EOC
  not_if 'test -f /var/lib/jenkins/.chefdk/gem/ruby/2.1.0/gems/kitchen-openstack-1.8.1/Gemfile'
end

directory '/var/lib/jenkins/.kitchen' do
  owner 'jenkins'
  group 'jenkins'
  mode '755'
end

template '/var/lib/jenkins/.kitchen/config.yml' do
  source 'kitchen-config-yml.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '644'
end
