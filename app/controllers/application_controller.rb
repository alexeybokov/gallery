class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_categories


  private

  def init_categories
    @categories = Category.order(:title).limit(5)
  end
end
