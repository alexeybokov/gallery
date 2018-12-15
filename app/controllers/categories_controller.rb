class CategoriesController < ApplicationController

  before_action :find_category, only: %i[show destroy follow unfollow]

  def index
    @categories = Category.all.order(images_count: :desc).page(params[:page])
    record_activity('navigation')
  end

  def show
    @images = @category.images.page(params[:page]).per 12
    record_activity('navigation')
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(categories_params)

    if @category.save
      record_activity('create category')
      flash[:notice] = 'Category created'
      redirect_to categories_path
    else
      flash[:alert] = 'Category was not create, try again'
      render 'new'
    end
  end

  def destroy
    @category.destroy
    record_activity('delete category')
    flash[:alert] = 'Category and images removed'
    redirect_to categories_path
  end

  def follow
    current_user.follow(@category)
    @follow = Follow.find_by(follower: current_user, followable: @category)
    UserMailer.with(user: current_user, category: params[:id]).follow_email.deliver_now
    record_activity('follow category')
    redirect_to category_path
  end

  def unfollow
    current_user.stop_following(@category)
    record_activity('unfollow category')
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
