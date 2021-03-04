# frozen_string_literal: true

# reset_password_controller, defines the way to reset forgotten passwords.
class PasswordResetController < ApplicationController
  def new; end

  #send email
  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to users_path, notice: 'if an account asociated to this email was found, we have
                                  sent a link to reset your password'
  end

  # take the token and look up
  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to signup_path, alert: 'your token has expired. please try again'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to login_path, notice: 'your password was reset successfuly. please sign in.'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
