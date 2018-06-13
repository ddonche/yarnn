class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  before_action :set_notifications
  
  def set_notifications
    if user_signed_in?
      @notifications = Notification.where({ read: false, recipient_id: current_user.id })
    end
  end
  
  def after_sign_in_path_for(resource)
    feed_path
  end
end
