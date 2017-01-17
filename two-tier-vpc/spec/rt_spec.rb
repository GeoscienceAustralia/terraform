describe route_table('twotiertest-public-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should belong_to_vpc('twotiertest-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('twotiertest-public-subnet-dev-ap-southeast-2a') }
end

describe route_table('twotiertest-public-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should belong_to_vpc('twotiertest-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('twotiertest-public-subnet-dev-ap-southeast-2b') }
end

describe route_table('twotiertest-private-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should belong_to_vpc('twotiertest-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('twotiertest-private-subnet-dev-ap-southeast-2b') }
end

describe route_table('twotiertest-public-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should belong_to_vpc('twotiertest-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('twotiertest-public-subnet-dev-ap-southeast-2c') }
end

describe route_table('twotiertest-private-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should belong_to_vpc('twotiertest-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('twotiertest-private-subnet-dev-ap-southeast-2a') }
end

describe route_table('twotiertest-private-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should belong_to_vpc('twotiertest-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('twotiertest-private-subnet-dev-ap-southeast-2c') }
end
