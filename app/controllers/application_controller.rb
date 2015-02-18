class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def render_404
  	render file: Rails.root.join("public", "404"), layout: false, status: "404"
  end

  def render_403
  	head :forbidden
  end

  protected 

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
