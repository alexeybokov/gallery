class DashboardController < ApplicationController
  def index
    @category = Category.all
    @images = Image.all
    record_activity('navigation')
  end
end
