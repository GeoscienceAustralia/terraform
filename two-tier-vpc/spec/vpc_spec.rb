describe vpc('2tiertest-vpc') do
  it { should exist }
  it { should be_available }
  its(:cidr_block) { should eq '10.0.0.0/16' }
  it { should have_route_table('2tiertest-public-subnet-dev-ap-southeast-2a') }
  it { should have_route_table('2tiertest-public-subnet-dev-ap-southeast-2b') }
  it { should have_route_table('2tiertest-public-subnet-dev-ap-southeast-2c') }
  it { should have_route_table('2tiertest-private-subnet-dev-ap-southeast-2b') }
  it { should have_route_table('2tiertest-private-subnet-dev-ap-southeast-2a') }
  it { should have_route_table('2tiertest-private-subnet-dev-ap-southeast-2c') }
end
