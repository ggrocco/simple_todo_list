# frozen_string_literal: true

module DeviseMacro
  def login_user
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
    @user
  end

  def each_login_user
    before do
      login_user
    end
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include DeviseMacro
end
