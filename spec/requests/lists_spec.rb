require 'spec_helper'

describe "Lists" do
 
  before(:each) do
    @user = Factory.create(:user)
    sign_in(@user)
  end
  
  describe "simple actions" do
    it "add list" do
      visit new_my_list_path

      within("div#content") do
        fill_in 'Name', :with => 'My test list'
        fill_in 'Todo', :with => 'My todo 1'
        click_button "Create List"
      end
      page.should have_content('List was successfully created.')
    end
    
    it "add list to favorite list" do
      visit lists_path
      click_link "Follow list"
      page.should have_content('My favorites')
    end
  end
  
  # describe "with js", :js =>true do
  #     before(:all) do
  #       Capybara.register_driver :selenium do |app|
  #         Capybara::Selenium::Driver.new(app, :browser => :chrome)
  #       end
  #     end
  #     
  #     it "add list" do
  #       visit new_my_list_path
  # 
  #       within("div#content") do
  #         fill_in 'Name', :with => 'My test list'
  #         fill_in 'Todo', :with => 'My todo 1'
  #         click_button "Create List"
  #       end
  #       page.should have_content('List was successfully created.')
  #     end
  #   end
end
