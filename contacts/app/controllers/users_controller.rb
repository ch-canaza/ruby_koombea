# frozen_string_literal: true

# defines methods for user's CRUD
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, only: %i[show edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user_contacts = @user.contact
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id

        format.html { redirect_to contacts_path, notice: "User #{@user.name} was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  # @user = User.find_by_name(params[:id]) which is better ??
  def set_user
    @user = User.find_by(name: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :description, :user_name, :user_image, :password, :password_confirmation)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = 'You can only edit your own account'
      redirect_to @user
    end
  end
end
