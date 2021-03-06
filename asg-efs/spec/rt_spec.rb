describe route_table('asg-efs-public-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should belong_to_vpc('asg-efs-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('asg-efs-public-subnet-dev-ap-southeast-2a') }
end

describe route_table('asg-efs-public-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should belong_to_vpc('asg-efs-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('asg-efs-public-subnet-dev-ap-southeast-2b') }
end

describe route_table('asg-efs-private-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should belong_to_vpc('asg-efs-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('asg-efs-private-subnet-dev-ap-southeast-2b') }
end

describe route_table('asg-efs-public-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should belong_to_vpc('asg-efs-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('asg-efs-public-subnet-dev-ap-southeast-2c') }
end

describe route_table('asg-efs-private-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should belong_to_vpc('asg-efs-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('asg-efs-private-subnet-dev-ap-southeast-2a') }
end

describe route_table('asg-efs-private-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should belong_to_vpc('asg-efs-vpc') }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_subnet('asg-efs-private-subnet-dev-ap-southeast-2c') }
end
