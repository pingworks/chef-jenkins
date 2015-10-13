# Java Home
default['pw_jenkins']['java']['home'] = '/usr/lib/jvm/default-java'

# Jenkins version
default['pw_jenkins']['master']['version'] = '1.609.3'

# jenkins config git url
default['pw_jenkins']['master']['jenkins_config_git_url'] = ''

# Plugins to install, with exact Version Number
# (extracted from a real, prototype installation with:
# java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar
# -s http://localhost:8080/ list-plugins | sort
# | sed -r 's;\s{1,}; ;g; s; \([0-9.]{1,}\)$;;g; s;^([a-zA-Z0-9-]{1,}) .* ([0-9.-]{1,})$;["\1", "\2"],;'
default['pw_jenkins']['master']['plugin_baseurl'] = 'http://mirrors.jenkins-ci.org/plugins/'
default['pw_jenkins']['master']['plugin_list'] = [
  ['dashboardintegration', '394+gitdee22fe', 'https://dash.pingworks.net/plugins'],
  ['ant', '1.2'],
  ['ansicolor', '0.4.1'],
  ['antisamy-markup-formatter', '1.1'],
  ['build-flow-plugin', '0.18'],
  ['build-name-setter', '1.3'],
  ['build-pipeline-plugin', '1.4.8'],
  ['claim', '2.7'],
  ['conditional-buildstep', '1.3.3'],
  ['copyartifact', '1.36'],
  ['credentials', '1.23'],
  ['cvs', '2.12'],
  ['dashboard-view', '2.9.6'],
  ['emotional-jenkins-plugin', '1.2'],
  ['envinject', '1.92.1'],
  ['external-monitor-job', '1.4'],
  ['git-client', '1.19.0'],
  ['git', '2.4.0'],
  ['greenballs', '1.14'],
  ['groovy-postbuild', '2.2.1'],
  ['jacoco', '1.0.19'],
  ['javadoc', '1.3'],
  ['jenkinswalldisplay', '0.6.27'],
  ['jobConfigHistory', '2.12'],
  ['join', '1.16'],
  ['jquery', '1.11.2-0'],
  ['ldap', '1.11'],
  ['m2release', '0.14.0'],
  ['mailer', '1.15'],
  ['mapdb-api', '1.0.1.0'],
  ['matrix-auth', '1.2'],
  ['matrix-project', '1.6'],
  ['maven-info', '0.2.0'],
  ['maven-plugin', '2.12'],
  ['multiple-scms', '0.5'],
  ['pam-auth', '1.2'],
  ['parameterized-trigger', '2.29'],
  ['performance', '1.13'],
  ['postbuild-task', '1.8'],
  ['preSCMbuildstep', '0.3'],
  ['PrioritySorter', '3.4'],
  ['rebuild', '1.25'],
  ['repository', '1.2'],
  ['run-condition', '1.0'],
  ['scm-api', '0.2'],
  ['scm-sync-configuration', '0.0.8'],
  ['script-security', '1.15'],
  ['ssh-credentials', '1.11'],
  ['ssh-slaves', '1.10'],
  ['subversion', '2.5.3'],
  ['swarm', '2.0'],
  ['token-macro', '1.10'],
  ['translation', '1.12'],
  ['windows-slaves', '1.1'],
  ['xvfb', '1.0.16']
]

# Jenkins installation urls
default['pw_jenkins']['master']['install_method'] = 'download_deb'
default['pw_jenkins']['master']['mirror'] = 'http://mirrors.jenkins-ci.org/plugins/'
default['pw_jenkins']['master']['updatecenter'] = 'http://mirrors.jenkins-ci.org/updates/'
default['pw_jenkins']['master']['source'] = "http://pkg.jenkins-ci.org/debian-stable/binary/jenkins_#{node['pw_jenkins']['master']['version']}_all.deb"

default['pw_jenkins']['master']['home'] = '/var/lib/jenkins'
default['pw_jenkins']['master']['log_directory'] = '/var/log/jenkins'
default['pw_jenkins']['master']['listen_address'] = '0.0.0.0'
default['pw_jenkins']['master']['port'] = 8080
default['pw_jenkins']['master']['jenkins_args'] = '--prefix=/jenkins'
default['pw_jenkins']['master']['url'] = 'http://localhost:8080/jenkins'

# JVM options
default['pw_jenkins']['master']['jvm_options'] = '-XX:MaxPermSize=1024m -Dorg.eclipse.jetty.server.Request.maxFormContentSize=500000'
default['pw_jenkins']['slave']['jvm_options'] = '-XX:MaxPermSize=512m'

# slave config
default['pw_jenkins']['slave']['home'] = '/var/lib/jenkins'
default['pw_jenkins']['slave']['shell'] = '/bin/bash'
default['pw_jenkins']['slave']['swarm_version'] = '2.0'
default['pw_jenkins']['slave']['swarm_jar'] = "swarm-client-#{node['pw_jenkins']['slave']['swarm_version']}-jar-with-dependencies.jar"
default['pw_jenkins']['slave']['swarm_base_url'] = 'http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/'
default['pw_jenkins']['slave']['master_url']           = 'http://jkmaster:8080/jenkins'
default['pw_jenkins']['slave']['jenkins_ui_user']      = 'jenkins-ui-user'
default['pw_jenkins']['slave']['jenkins_ui_password']  = 'jenkins-ui-password'
default['pw_jenkins']['slave']['labels']               = ''
default['pw_jenkins']['slave']['name']                 = ''
default['pw_jenkins']['slave']['executors']            = '1'
default['pw_jenkins']['slave']['options']              = '-disableClientsUniqueId'
