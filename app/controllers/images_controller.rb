# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @images = Image.all.order('created_at DESC')
  end

  def show
    @comments = Comment.where(image_id: @image).order('created_at DESC')
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save!
    # if @image.save
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
    redirect_to root_path
  end

  def edit
    @image = Image.find(params[:id])
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :picture)
  end
end
