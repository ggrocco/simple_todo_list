require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  helper_method :is_owner?, :home_user_url

  protect_from_forgery
  
  def home_user_url
     user_signed_in? ? home_url(current_user.username) : root_url
   end
   
  def is_owner?
    (user_signed_in? && params[:username] == current_user.username)
  end
end
