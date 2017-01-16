require 'awspec'

describe ec2('twotiertest-jumpbox') do
  it { should exist }
  it { should be_running }
  its(:image_id) { should eq 'ami-4d3b062e' }
  its(:instance_type) { should eq 't2.nano' }
  it { should have_security_group('jump_ssh') }
  it { should belong_to_vpc('twotiertest-vpc') }
end

describe ec2('twotiertest_asg') do
  it { should exist }
  it { should be_running }
  its(:image_id) { should eq 'ami-4d3b062e' }
  its(:instance_type) { should eq 't2.micro' }
  it { should have_security_group('elb_http_inbound') }
  it { should have_security_group('app_ssh_inbound') }
  it { should have_security_group('elb_outbound') }
  it { should have_security_group('elb_https_inbound') }
  it { should belong_to_vpc('twotiertest-vpc') }
end
