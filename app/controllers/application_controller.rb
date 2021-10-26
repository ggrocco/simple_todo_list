# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def record_not_found
    render plain: '404 Not Found', status: :not_found
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
