class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'user'
  require 'admin'

  layout 'application'

  helper_method :current_user, :current_admin
    
  private

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = AuthenticateApiRequest.call(request.headers).result
  end

  def current_admin
    return @current_admin if defined?(@current_admin)
    @current_admin = AuthenticateApiRequestAdmin.call(request.headers).result    
  end

end
