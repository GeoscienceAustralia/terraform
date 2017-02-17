
describe security_group('elb_web_inbound') do
  it { should exist }
  its(:group_name) { should eq 'elb_web_inbound' }
  its(:inbound) { should be_opened(80).protocol('tcp').for('0.0.0.0/0') }
  its(:outbound) { should be_opened.protocol('all').for('0.0.0.0/0') }
  its(:inbound_rule_count) { should eq 1 }
  its(:outbound_rule_count) { should eq 1 }
  its(:inbound_permissions_count) { should eq 1 }
  its(:outbound_permissions_count) { should eq 1 }
  it { should belong_to_vpc('codedeploy-vpc') }
end
