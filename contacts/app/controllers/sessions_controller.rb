class SessionsController < ApplicationController


    def new
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password_digest])
        session[:user_id] = user.id
        
        flash[:notice] = "logged in succesfully"
        puts "something is good"
        redirect_to user
      
      else
        flash.now[:notice] = "there were something wrong with your login"
        puts "something is wrong"
        render 'new'

      end

    end

    def destroy
      session[:user_id] = nil 
      flash[:notice] = "logged out"
      redirect_to root_path
    end

end