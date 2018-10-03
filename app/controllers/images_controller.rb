class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    flash[:notice] = "#{@image.title} was created!" if @image.save
    respond_with @image
  end

  private

  def image_params
    params.require(:image).permit(:title, :picture)
  end
end
