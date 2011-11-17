require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory.build(:user)
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
  
  it "User without username is not valid" do
    @user.username = nil
    @user.should_not be_valid
    @user.should have(2).error_on(:username)
    
    @user.username = "x"*4
    @user.should_not be_valid
    @user.should have(1).error_on(:username)
      
    @user.username = "x"*26
    @user.should_not be_valid
    @user.should have(1).error_on(:username)
    
    @user.username = "tester"
    @user.should be_valid
  end
end
