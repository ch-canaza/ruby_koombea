class HomeController < ApplicationController
  def index
    redirect_to contacts_path if logged_in?
  end
end