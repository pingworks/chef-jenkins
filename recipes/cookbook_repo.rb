apt_package 'apache2'

template '/etc/apache2/conf-available/cookbook-repo.conf' do
  source 'confd_cookbook-repo_alias.erb'
  owner "root"
  group "root"
  mode '644'
end

bash 'enable_apache_conf' do
  code 'a2enconf cookbook-repo'
end

bash 'apache2_restart' do
  code 'service apache2 restart'
end

directory node['ws-jenkins']['cookbook-repo']['dir'] do
  owner node['ws-jenkins']['cookbook-repo']['owner']
  group node['ws-jenkins']['cookbook-repo']['group']
  mode '0755'
  recursive true
end
