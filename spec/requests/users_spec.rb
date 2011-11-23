require 'spec_helper'

describe "Users" do
  describe "the signup process" do
    before(:each) do
      @user = Factory.create(:user)
    end
        
    it "signin with email" do
      sign_in(@user)
      click_link 'Sign Out'
    end
    
    it "signin with username" do
      visit root_path
      within("div#login_box") do
        fill_in 'user_login', :with => @user.username
        fill_in 'user_password', :with => @user.password
      end      
      click_button 'Sign in'
      page.should have_content('Signed in successfully.')
      click_link 'Sign Out'
    end
  end  
end
