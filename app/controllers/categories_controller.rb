class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(categories_params)
    @categories.save!
    # if @categories.save
    redirect_to categories_path
    # else
    #   render 'new'
    # end
  end

  private

  def categories_params
    params.require(:category).permit(:title)
  end
end
