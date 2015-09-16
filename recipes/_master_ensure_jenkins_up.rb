execute 'start-jenkins' do
  command 'echo w00t'
  notifies :start, 'service[jenkins]', :immediately
end

bash 'ensure jenkins is up and running' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  WAITMAX=30
  I=0
  JENKINS_UP=0
  while [ $I -le $WAITMAX ];do
    T=$(date)
    echo "$T: wait $I" >> /tmp/debug.txt
    if java -jar /usr/local/lib/jenkins/jenkins-cli.jar -s http://localhost:8080/ version >/dev/null 2>&1;then
      echo "$T: Jenkins up!" >> /tmp/debug.txt
      JENKINS_UP=1
      break
    fi
    sleep 1
    I=$(( $I + 1 ))
  done
  if [ $JENKINS_UP -eq 0 ];then
    echo "$T: Jenkins never came up. Giving up!" >> /tmp/debug.txt
    echo "Jenkins never came up. Giving up!"
    exit 1
  fi
  EOH
end
