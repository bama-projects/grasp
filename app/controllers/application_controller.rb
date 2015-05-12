class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound,   with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found

  def raise_routing_error
    raise ActionController::RoutingError.new params[:path]
  end

  private

  def not_found
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  protected

  # Announces new field 'username' to Devise gem
  # Taken from http://stackoverflow.com/a/21486039 | SNEH PANDYA | 11th May 2015, 8:17 am
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
