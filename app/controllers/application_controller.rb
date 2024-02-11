class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You are not authorized to access this page."
  end
  # protect_from_forgery with: :exception
  before_action :load_ability

  private

  def load_ability
    @current_ability ||= Ability.new(current_user)
  end
#error handling for not existing routes
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    redirect_to not_found_error_path
  end
end
