class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound,   with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found

  def raise_routing_error
    raise ActionController::RoutingError.new params[:path]
  end

  private

  def not_found
    render file: "#{Rails.root}/public/404"
  end
end
