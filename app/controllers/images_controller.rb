# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_image, only: :show

  def new
    @image = Image.new
  end

  def index
    @images = Image.all.order('created_at DESC')
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
      flash[:notice] = 'Image not save'
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

  def vote
    if !current_user.liked? @image
      @image.liked_by current_user
    elsif
      current_user.liked? @image
      @image.unliked_by current_user
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :category_id, :picture)
  end
end
