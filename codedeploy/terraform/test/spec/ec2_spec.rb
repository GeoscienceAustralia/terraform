require 'awspec'
require 'ec2_helper'

describe ec2(EC2Finder.GetIdFromName('codedeploy_asg')) do
  it { should exist }
  it { should be_running }
  its(:image_id) { should eq 'ami-4d3b062e' }
  its(:instance_type) { should eq 't2.micro' }
  it { should have_security_group('elb_web_inbound') }
  it { should have_security_group('app_outbound') }
  it { should belong_to_vpc('codedeploy-vpc') }
end
