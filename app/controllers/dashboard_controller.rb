class DashboardController < ApplicationController
  def index
    @category = Category.all
    @images = Image.all
  end
end

