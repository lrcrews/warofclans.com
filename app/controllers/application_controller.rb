class ApplicationController < ActionController::Base
  

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  after_action :set_csrf_cookie


  private def set_csrf_cookie
    cookies[:csrf] = form_authenticity_token if protect_against_forgery?
  end


end
