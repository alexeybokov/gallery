class CategoriesController < ApplicationController

  before_action :find_category, only: %i[show destroy follow unfollow]


  def index
    @categories = Category.all.order(images_count: :desc).page(params[:page])
  end

  def show
    @images = @category.images.page(params[:page]).per 12
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

  def destroy
    @category.destroy
    flash[:alert] = 'Category and images removed'
    redirect_to categories_path
  end

  def follow
    current_user.follow(@category)
    @follow = Follow.find_by(follower: current_user, followable: @category)
    UserMailer.with(user: current_user, category: params[:id]).follow_email.deliver_now
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
    @category = Category.friendly.find(params[:id])
  end
end
