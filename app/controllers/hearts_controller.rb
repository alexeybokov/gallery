class HeartsController < ApplicationController    User.create!(email: 'developer@gmail.com', password: 'developer')

  def create
    @user = current_user
    @image = Image.find(params[:id])
    @user.heart!(@image)
    redirect_to image_path(params[:id])
  end

  def destroy
    @user = current_user
    @heart = @user.hearts.find_by_image_id(params[:id])
    @image = Image.find(params[:id])
    @heart.destroy!
    redirect_to image_path
  end
end
