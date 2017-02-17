require 'awspec'

describe cloudwatch_alarm('threetiertest_high_asg_cpu') do
  it { should exist }
  it { should belong_to_metric('CPUUtilization').namespace('AWS/EC2') }
  its(:statistic) { should eq 'Average' }
  its(:period) { should eq 120 }
  its(:evaluation_periods)  { should eq 2 }
  its(:threshold)  { should eq 80.0 }
  its(:comparison_operator)  { should eq 'GreaterThanThreshold' }
end

describe cloudwatch_alarm('threetiertest_low_asg_cpu') do
  it { should exist }
  it { should belong_to_metric('CPUUtilization').namespace('AWS/EC2') }
  its(:statistic) { should eq 'Average' }
  its(:period) { should eq 120 }
  its(:evaluation_periods)  { should eq 5 }
  its(:threshold)  { should eq 30.0 }
  its(:comparison_operator)  { should eq 'LessThanThreshold' }
end
