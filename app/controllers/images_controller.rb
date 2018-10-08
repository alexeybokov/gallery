class ImagesController < ApplicationController
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

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:name, :category_id, :picture)
  end
end

