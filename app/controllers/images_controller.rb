# frozen_string_literal: true

class ImagesController < ApplicationController
  respond_to :html, :js

  before_action :set_image, only: :show

  def new
    @image = Image.new
  end

  def index
    @images = Image.all.order(created_at: :desc).page(params[:page])
    @category = Category.all
  end

  def show
    @comments = Comment.where(image_id: @image).order('created_at DESC')
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:notice] = 'Image Uploaded'
      redirect_to root_path
    else
      flash[:alert] = 'Image not save'
      render 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    flash[:notice] = 'Image removed'

    redirect_to images_path
  end

  def heart
    @user = current_user
    @image = Image.find(params[:id])
    @user.heart!(@image)
  end

  def unheart
    @user = current_user
    @heart = @user.hearts.find_by_image_id(params[:id])
    @image = Image.find(params[:id])
    @heart.destroy!
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :category_id, :picture)
  end
end
