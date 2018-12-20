class DashboardController < ApplicationController
  def index
    @category = Category.all
    @images = Image.all
    record_activity('navigation') unless current_user.nil?
  end
end
