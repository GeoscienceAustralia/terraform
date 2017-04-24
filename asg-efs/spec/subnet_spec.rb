describe subnet('asg-efs-public-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('asg-efs-vpc') }
end

describe subnet('asg-efs-private-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('asg-efs-vpc') }
end

describe subnet('asg-efs-private-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('asg-efs-vpc') }
end

describe subnet('asg-efs-public-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('asg-efs-vpc') }
end

describe subnet('asg-efs-public-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('asg-efs-vpc') }
end

describe subnet('asg-efs-private-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('asg-efs-vpc') }
end
