class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :about_us]

  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def set_layout
    if params[:controller] == "pages" && %w[statistics calendar daily_program my_profile trophies].include?(params[:action])
      "in_program"
    elsif params[:controller] == "devise/registrations" && params[:action] == "edit"
      "in_program"
    else
      "application"
    end
  end
end
