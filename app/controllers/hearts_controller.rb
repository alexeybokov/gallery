class HeartsController < ApplicationController
  respond_to :js

  def heart
    @user = current_user
    @image = Image.find(params[:image_id])
    @user.heart!(@image)
    redirect_to images_path
  end

  def unheart
    @user = current_user
    @heart = @user.hearts.find_by_image_id(params[:image_id])
    @image = Image.find(params[:image_id])
    @heart.destroy!
    redirect_to images_path
  end
end
