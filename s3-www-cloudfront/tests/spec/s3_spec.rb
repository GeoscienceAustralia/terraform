require 'awspec'

describe s3_bucket('ga-tf-s3cfexample') do
  it { should exist }
  its(:acl_owner) { should eq 'ga_aws_devs' }
  its(:acl_grants_count) { should eq 1 }
  it { should have_acl_grant(grantee: 'ga_aws_devs', permission: 'FULL_CONTROL') }
end
