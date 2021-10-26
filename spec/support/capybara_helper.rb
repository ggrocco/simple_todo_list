# frozen_string_literal: true

module CapybaraHelper
  def sign_in(user)
    visit root_path
    within('div#login_box') do
      fill_in 'user_login', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'Sign in'
    page.should have_content('Signed in successfully.')
  end
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end
