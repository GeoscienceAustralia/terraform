describe subnet('codedeploy-public-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end

describe subnet('codedeploy-private-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end

describe subnet('codedeploy-private-subnet-dev-ap-southeast-2a') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end

describe subnet('codedeploy-public-subnet-dev-ap-southeast-2b') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end

describe subnet('codedeploy-public-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end

describe subnet('codedeploy-private-subnet-dev-ap-southeast-2c') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('codedeploy-vpc') }
end
