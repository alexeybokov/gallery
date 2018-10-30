class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(categories_params)

    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def categories_params
    params.require(:category).permit(:title)
  end
end
