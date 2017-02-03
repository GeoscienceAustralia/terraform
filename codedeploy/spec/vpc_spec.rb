describe vpc('codedeploy-vpc') do
  it { should exist }
  it { should be_available }
  its(:vpc_id) { should eq 'vpc-3bd60f5f' }
  its(:cidr_block) { should eq '10.0.0.0/16' }
  it { should have_route_table('codedeploy-private-subnet-dev-ap-southeast-2b') }
  it { should have_route_table('codedeploy-public-subnet-dev-ap-southeast-2c') }
  it { should have_route_table('codedeploy-private-subnet-dev-ap-southeast-2c') }
  it { should have_route_table('codedeploy-public-subnet-dev-ap-southeast-2a') }
  it { should have_route_table('codedeploy-public-subnet-dev-ap-southeast-2b') }
  it { should have_route_table('codedeploy-private-subnet-dev-ap-southeast-2a') }
  it { should have_route_table('rtb-f4ea7390') }
  it { should have_network_acl('acl-3b90075f') }
end
