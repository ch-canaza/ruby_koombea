class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
   
  end

  def logged_in?
    !!current_user    ## (!!)  convierte el elemento en un boolean

  end

  def require_user
    ## verify loged_in user
    if !logged_in?
      flash[:alert] = "Youu must be logged in to perform that action"
      redirect_to login_path

      ## erfify if is the authorized user
      
    end
  end 
end
