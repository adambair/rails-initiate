require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it 'should have a full name' do
    user = User.create(:first_name => 'jack', :last_name => 'handy')
    user.full_name.should == "jack handy"
  end

  it 'a full name should handle only a first name or last name' do
    user = User.create(:first_name => 'happy')
    user.full_name.should == "jack"
  end
end

