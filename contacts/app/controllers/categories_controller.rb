class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def show
    @category = Category.find(params[:id])
    @contacts = @category.contacts.paginate(page: params[:page], per_page: 3)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category was succesfully crated'
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = 'category name updated succesfully'
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:alert] = 'Only admins can perfomr that action'
      redirect_to categories_path
    end
  end
end
