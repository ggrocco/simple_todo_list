require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new( :email => 'test@test.com', :password => '1234change' )
  end
    
  it "User with email and password is valid" do
    @user.should be_valid
  end
  
  it "User without email is not valid" do
    @user.email = nil
    @user.should_not be_valid
    @user.should have(1).error_on(:email)
    
    @user.email = "invalid e-mail"
    @user.should_not be_valid
    @user.should have(1).error_on(:email)
        
    @user.email = "test@test.com"
    @user.should be_valid
  end
  
  it "User without password is not valid" do
    @user.password = nil
    @user.should_not be_valid
    @user.should have(1).error_on(:password)
    
    @user.password = ""
    @user.should_not be_valid
    @user.should have(1).error_on(:password)
        
    @user.password = "1234change"
    @user.should be_valid
  end
end
