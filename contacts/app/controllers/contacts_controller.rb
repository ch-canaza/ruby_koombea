# frozen_string_literal: true

# defines methods for CRUD
class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @contacts = Contact.all
  end

  def show
    @link = @contact.links
  end

  def new
    @contact = Contact.new
    @contact.links.build
  end

  def edit
    @contact.links.build
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(
      :first_name,
      :last_name,
      :media,
      :image,
      links_attributes:
      %i[id _destroy contacts_id first_name media]
    )
  end

  # verify if an action is performed by the current user
  def require_same_user
    if current_user != @contact.user && !current_user.admin?
      flash[:alert] = 'You can edit or delete your own article'
      redirect_to @contact
    end
  end
end
