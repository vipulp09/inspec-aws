title 'Test a single AWS AMI'

control 'aws-ami-1.0' do

  impact 1.0
  title 'Ensure AWS AMI has current properties'

  describe aws_ami(image_id: 'ami-0a13d44dccf1f5cf6') do
    it { should exist }
    it { should be_public }
    its('architecture')      { should eq 'x86_64' }
    its('image_id')          { should eq 'ami-0a13d44dccf1f5cf6' }
    its('image_type')        { should eq 'machine' }
    its('platform_details')  { should eq 'Linux/UNIX' }
    its('image_owner_alias') { should eq 'amazon' }
    its('usage_operation')   { should eq 'RunInstances' }
    its('state')             { should eq 'available' }
  end

  describe aws_ami(image_id: '000000') do
    it { should_not exist }
  end
end
