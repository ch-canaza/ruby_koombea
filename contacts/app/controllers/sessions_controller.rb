# frozen_string_literal: true

# defines user's session actions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password_digest])
      session[:user_id] = user.id
      flash[:notice] = 'logged in succesfully'
      redirect_to user
    else
      flash.now[:alert] = 'there were something wrong with your login'
      puts 'something is wrong'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:notice] = 'logged out'
    redirect_to root_path
  end
end
