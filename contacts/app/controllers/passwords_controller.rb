# frozen_string_literal: true

# password_controller, defines the way to edit passwords.
class PasswordsController < ApplicationController
  before_action :require_user

  def edit; end

  def update_pass
    if current_user.update(password_params)
      puts 'saved'
      redirect_to current_user, notice: 'password updated succesfully'
    else
      puts current_user.errors.full_messages
      puts 'something went wrong'
      flash.now[:alert] = 'password did not match'
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
