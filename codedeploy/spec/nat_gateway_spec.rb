describe nat_gateway('nat-0f49a701aa2da5840') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end
