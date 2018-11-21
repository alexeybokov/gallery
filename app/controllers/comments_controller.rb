class CommentsController < ApplicationController

  before_action :find_image, only: :create

  def index
    @comments = Comment.order(created_at: :desc).page(params[:page])
  end

  def create
    @image.comments.create(comment_params.merge(user: current_user))
    redirect_to image_path(@image)
  end

  private

  def find_image
    @image = Image.friendly.find(params[:image_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :image_id)
  end
end
