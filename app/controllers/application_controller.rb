require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  protect_from_forgery

  protected 
  
  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => :not_found
  end
end
