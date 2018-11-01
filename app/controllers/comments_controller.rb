class CommentsController < ApplicationController

  before_action :find_image, only: :create

  def create
    @image.comments.create(comment_params.merge(user: current_user))
    redirect_to image_path(@image)
  end

  def index
    @comments = Comment.order(created_at: :desc)
  end

  private

  def find_image
    @image = current_user.images.find(params[:image_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
