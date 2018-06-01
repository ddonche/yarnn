module DeviseWhitelist 
  extend ActiveSupport::Concern
  
  included do
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name])
  end
end