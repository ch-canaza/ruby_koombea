# frozen_string_literal: true

# aplication_controller, defines some authentication methods.
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end

  # converts the current_user variable into a boolean
  def logged_in?
    !!current_user
  end

  ## verify loged_in user
  def require_user
    if !logged_in?
      flash[:alert] = 'You must be logged in to perform that action'
      redirect_to login_path
    end
  end
end
