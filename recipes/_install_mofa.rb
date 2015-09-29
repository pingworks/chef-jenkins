bash 'install mofa' do
  user 'jenkins'
  cwd '/var/lib/jenkins'
  code <<-EOC
  export HOME=/var/lib/jenkins
  eval "$(chef shell-init bash)"
  chef gem install mofa
  EOC
  not_if 'test -f /var/lib/jenkins/.chefdk/gem/ruby/2.1.0/gems/mofa-*/Gemfile'
end

directory '/var/lib/jenkins/.mofa' do
  owner 'jenkins'
  group 'jenkins'
  mode '755'
end

cookbook_file 'mofa-config.yml' do
  path '/var/lib/jenkins/.mofa/config.yml'
  owner 'jenkins'
  group 'jenkins'
  mode '644'
end
