class DashboardController < ApplicationController
  def index
    @category = Category.all
    @images = Image.all.limit(20)
    record_activity('navigation') unless current_user.nil?
  end
end
