class CategoriesController < ApplicationController

  before_action :find_category, only: %i[show follow unfollow]

  def index
    @categories = Category.all
  end

  def show
    @images = Category.find(params[:id]).images.page(params[:page]).per 12
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

  def follow
    current_user.follow(@category)
    @follow = Follow.find_by(follower: current_user, followable: @category)
    respond_to :js
    redirect_to category_path
  end

  def unfollow
    current_user.stop_following(@category)
    respond_to :js
    redirect_to category_path
  end

  private

  def categories_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
