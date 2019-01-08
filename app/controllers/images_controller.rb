# frozen_string_literal: true

class ImagesController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!
  before_action :set_image, only: [:show, :edit]

  def new
    @image = Image.new
  end

  def index
    @images = Image.order(hearts_count: :desc).page(params[:page])
    record_activity('navigation')
  end

  def show
    @comments = Comment.where(image_id: @image).order('created_at DESC')
    record_activity('navigation')
  end

  def create
    @image = current_user.images.build(image_params)

    if @image.save
      record_activity('create image')
      UserMailer.with(user: current_user, category: params[:id]).new_image_email.deliver_now
      flash[:notice] = 'Image Uploaded'
      redirect_to image_path(@image)
    else
      flash[:alert] = 'Image not save'
      render 'new'
    end
  end

  def edit
  end

  private

  def set_image
    @image = Image.friendly.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :category_id, :picture)
  end
end
