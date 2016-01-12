class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_rights
      
    if !current_member.admin?
       redirect_to products_url, alert: 'You have to be admin to access this content'
    end

  end
end
