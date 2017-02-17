require 'awspec'
describe elb('codedeploy-elb') do
  it { should exist }
  its(:load_balancer_name) { should eq 'codedeploy-elb' }
  its(:health_check_target) { should eq 'HTTP:80/' }
  its(:health_check_interval) { should eq 60 }
  its(:health_check_timeout) { should eq 30 }
  its(:health_check_unhealthy_threshold) { should eq 2 }
  its(:health_check_healthy_threshold) { should eq 2 }
  it { should have_listener(protocol: 'HTTP', port: 80, instance_protocol: 'HTTP', instance_port: 80) }
end
