class CommentsController < ApplicationController
  before_action :find_image
  before_action :find_comment, only: [:destroy, :edit, :update] # :comment_owner]
  # before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    @comment = @image.comments.create(params[:comment].permit(:name, :comment))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      redirect_to image_path(@image)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to image_path(@image)
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:body))
      redirect_to image_path(@image)
    else
      render 'edit'
    end
  end

  private

  def find_image
    @image = Image.find(params[:image_id])
  end

  def find_comment
    @comment = @image.comments.find(params[:id])
  end

  # def comment_owner
  #   unless current_user.id == @comment.user_id
  #     flash[:notice] = 'You will not pass'
  #     redirect_to @image
  #   end
  # end
end
