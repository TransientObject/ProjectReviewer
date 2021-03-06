class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include AuthenticatedSystem
  before_filter :require_login

  helper_method :logged_in?
  helper_method :current_user
  helper_method :judge_logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end
  

  private
 
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/' # halts request cycle
    end
  end
end
