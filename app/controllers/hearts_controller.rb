class HeartsController < ApplicationController

  def create
    @user = current_user
    @image = Image.find(params[:id])
    @user.heart!(@image)
    record_activity('create heart')
  end

  def destroy
    @user = current_user
    @heart = @user.hearts.find_by_image_id(params[:id])
    @image = Image.find(params[:id])
    @heart.destroy!
  end
end
