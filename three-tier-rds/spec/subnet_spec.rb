describe subnet('teststack-public-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('teststack-vpc') }
  its(:cidr_block) { should eq '10.0.3.0/24' }
end

describe subnet('teststack-private-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('teststack-vpc') }
  its(:cidr_block) { should eq '10.0.52.0/24' }
end

describe subnet('teststack-private-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('teststack-vpc') }
  its(:cidr_block) { should eq '10.0.51.0/24' }
end

describe subnet('teststack-public-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('teststack-vpc') }
  its(:cidr_block) { should eq '10.0.2.0/24' }
end

describe subnet('teststack-public-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('teststack-vpc') }
  its(:cidr_block) { should eq '10.0.1.0/24' }
end

describe subnet('teststack-private-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('teststack-vpc') }
  its(:cidr_block) { should eq '10.0.53.0/24' }
end
