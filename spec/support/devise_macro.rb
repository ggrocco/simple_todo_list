module DeviseMacro
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user
  end
  
  def each_login_user
    before(:each) do
      login_user
    end
  end
end